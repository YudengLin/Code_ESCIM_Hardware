#include "cmd_process.h"
#include "lwip/sockets.h"
#include "xil_printf.h"
#include "xil_io.h"
#include "func_lab.h"
#include <string.h>
#include "app.h"
#include "sleep.h"
#include "FreeRTOS.h"
#include "task.h"
#include "netif/xadapter.h"

#ifndef LITTLE_ENDIAN
#define LITTLE_ENDIAN 1234
#endif

#ifndef BIG_ENDIAN
#define BIG_ENDIAN 4321
#endif

#ifndef PROCESSOR_LITTLE_ENDIAN
#define PROCESSOR_LITTLE_ENDIAN
#endif

#ifdef PROCESSOR_LITTLE_ENDIAN
#define BYTE_ORDER LITTLE_ENDIAN
#else
#define BYTE_ORDER BIG_ENDIAN
#endif

#define MAX_PAYLOAD_LEN 0xFFFF //最大负载数据包长度，可以更改，最大为0xFFFF
#define PAYLOAD_SEND_SELECT 0x0200 //超过此值，数据包发送要分次发，以防栈溢出

#define CMD_HEAD 0x3A
#define RESPONSE_HEAD 0x3B
#define PACKET_HEAD_LEN 0x07

#define CMD_NULL 0xFF
#define CMD_COMMON_START 0x80
#define CMD_DEBUG (0x01+CMD_COMMON_START)
#define CMD_WRITE_REG (0x02+CMD_COMMON_START)
#define CMD_READ_REG (0x03+CMD_COMMON_START)
#define CMD_SEQ_WRITE_REG (0x04+CMD_COMMON_START)
#define CMD_SEQ_READ_REG (0x05+CMD_COMMON_START)

#define CMD_CFG_REG 0x01
#define CMD_MAP_FLOW 0x02
#define CMD_MAP_PROGRESS 0x03
#define CMD_MAP_ABORT 0x04
#define CMD_MAP_RESULT 0x05
#define CMD_SEQ_READ 0x06
#define CMD_SET_TARGET 0x07
#define CMD_RESET_TARGET 0x08
#define CMD_APPLY_OP 0x09
#define CMD_OP_RESULT 0x0A

#define ERROR_FLAG 0x8F //返回错误码的前导字节
#define NO_ERROR 0x00
#define PAYLOAD_LEN_ERROR 0x01
#define CMD_NUM_ERROR 0x02
#define PARA1_ERROR 0x03
#define PARA2_ERROR 0x04
#define HEAD_CHECK_ERROR 0x05
#define PAYLOAD_CHECK_ERROR 0x06

#define CFG_REG_ERROR 0x07
#define MAP_FLOW_ERROR 0x08
#define MAP_ABORT_ERROR 0x09
#define SEQ_READ_ERROR 0x0A
#define SET_TARGET_ERROR 0x0B
#define RESET_TARGET_ERROR 0x0C
#define APPLY_OP_ERROR 0x0D

#define THREAD_STACKSIZE 2048

typedef enum DebugState
{
    DEBUG_ON=0,
    DEBUG_OFF=1
} DebugState_t;

static DebugState_t gDebugState = DEBUG_OFF;
static uint8_t gRecvBuf[MAX_PAYLOAD_LEN] = {0};
static uint8_t gSendBuf[MAX_PAYLOAD_LEN] = {0};
uint32_t gMapThreadRun = 0; // 1表示Map线程正在运行

extern uint32_t gMapProgress;
extern uint32_t gMapAbortFlag;
extern uint32_t gTargetBuf[4096];
extern uint32_t gMapResult[SL_COUNT][WL_COUNT];
extern uint32_t gOpResult[OP_RESULT_SIZE_INT];

static int RecvBlock(int sd, void *buf, uint32_t len)
{
    uint8_t *pData = buf;
    int remainder = len;
    int ret = 0;
    while (remainder > 0)
    {
        ret = recv(sd, pData, remainder, MSG_WAITALL);
        if (ret > 0)
        {
            pData += ret;
            remainder -= ret;
        }
        else
        {
            return -1;
        }
    }
    return 0;
}

static uint8_t CheckHead(uint8_t *HeadBuf)
{
    return 0;
}

static uint16_t CheckPayload(uint8_t *HeadBuf)
{
    return 0;
}

int SendPacket(int sd, uint8_t CmdNum, uint8_t ErrorNum, uint8_t *payload, uint16_t PayloadLen)
{
    uint8_t packet[PAYLOAD_SEND_SELECT+PACKET_HEAD_LEN+2] = {0};
    int ret = 0;
    uint16_t CrcVal = 0;
    uint8_t CrcArray[2] = {0};
    int ExpectedSendLen = PACKET_HEAD_LEN + PayloadLen + 2;
    packet[0] = RESPONSE_HEAD;
    packet[1] = CmdNum;
    packet[3] = ErrorNum;
    if (ErrorNum != NO_ERROR)
        packet[2] = ERROR_FLAG;

    packet[6] = CheckHead(packet);
    if (PayloadLen == 0)
    {
        PUT_UINT16_LE(PayloadLen, packet, 4);
        ret = write(sd, packet, PACKET_HEAD_LEN);
        ExpectedSendLen = PACKET_HEAD_LEN;
    }
    else if(PayloadLen > PAYLOAD_SEND_SELECT)
    {
        PUT_UINT16_LE(PayloadLen+2, packet, 4);
        //分次发送数据包，防止栈溢出
        CrcVal = CheckPayload(payload);
        PUT_UINT16_LE(CrcVal, CrcArray, 0);
        ret = write(sd, packet, PACKET_HEAD_LEN);
        ret += write(sd, payload, PayloadLen);
        ret += write(sd, CrcArray, 2);
    }
    else
    {
        PUT_UINT16_LE(PayloadLen+2, packet, 4);
        CrcVal = CheckPayload(payload);
        PUT_UINT16_LE(CrcVal, CrcArray, 0);
        memcpy(packet+PACKET_HEAD_LEN, payload, PayloadLen);
        memcpy(packet+PACKET_HEAD_LEN+PayloadLen, CrcArray, 2);
        ret = write(sd, packet, PACKET_HEAD_LEN+PayloadLen+2);
    }

    return (ret == ExpectedSendLen ? 0: -1);
}

int CmdWriteReg(int sd, uint8_t *buf)
{
    uint8_t CmdNum = buf[0];
    uint16_t RecvPayloadLen = 0;
    int ret = 0;
    GET_UINT16_LE(RecvPayloadLen, buf, 3);
    if (((RecvPayloadLen-2)&7) != 0)
    {
        SendPacket(sd, CmdNum, PAYLOAD_LEN_ERROR, NULL, 0);
        return -1;
    }

    if (RecvBlock(sd, gRecvBuf, RecvPayloadLen) < 0)
        return -1;

#if BYTE_ORDER != LITTLE_ENDIAN
    SwapUint32((uint32_t *)gRecvBuf, (RecvPayloadLen-2)>>2);
#endif

    uint32_t *TempPtr = (uint32_t *)gRecvBuf;
    uint32_t LenInt = (RecvPayloadLen-2)/4;
    for (int i=0; i<LenInt; i=i+2)
    {
        Xil_Out32(TempPtr[i], TempPtr[i+1]);
    }

    ret = SendPacket(sd, CmdNum, NO_ERROR, NULL, 0);
    return ret;
}

int CmdReadReg(int sd, uint8_t *buf)
{
    uint8_t CmdNum = buf[0];
    uint16_t RecvPayloadLen = 0;
    int ret = 0;
    GET_UINT16_LE(RecvPayloadLen, buf, 3);
    if (((RecvPayloadLen-2)&3) != 0)
    {
        SendPacket(sd, CmdNum, PAYLOAD_LEN_ERROR, NULL, 0);
        return -1;
    }

    if (RecvBlock(sd, gRecvBuf, RecvPayloadLen) < 0)
        return -1;

#if BYTE_ORDER != LITTLE_ENDIAN
    SwapUint32((uint32_t *)gRecvBuf, (RecvPayloadLen-2)>>2);
#endif

    uint32_t *RecvPtr = (uint32_t *)gRecvBuf;
    uint32_t *SendPtr = (uint32_t *)gSendBuf;
    uint32_t LenInt = (RecvPayloadLen-2)/4;
    for (int i=0; i<LenInt; i++)
    {
        SendPtr[i] = Xil_In32(RecvPtr[i]);
    }

#if BYTE_ORDER != LITTLE_ENDIAN
    SwapUint32((uint32_t *)gSendBuf, LenInt);
#endif

    ret = SendPacket(sd, CmdNum, NO_ERROR, gSendBuf, LenInt*4);
    return ret;
}

int CmdSeqWriteReg(int sd, uint8_t *buf)
{
    uint8_t CmdNum = buf[0];
    uint16_t RecvPayloadLen = 0;
    int ret = 0;
    GET_UINT16_LE(RecvPayloadLen, buf, 3);
    if (((RecvPayloadLen-2)&3) != 0)
    {
        SendPacket(sd, CmdNum, PAYLOAD_LEN_ERROR, NULL, 0);
        return -1;
    }

    if (RecvBlock(sd, gRecvBuf, RecvPayloadLen) < 0)
        return -1;

#if BYTE_ORDER != LITTLE_ENDIAN
    SwapUint32((uint32_t *)gRecvBuf, (RecvPayloadLen-2)>>2);
#endif

    uint32_t addr = ((uint32_t *)gRecvBuf)[0];
    memcpy((void *)addr, gRecvBuf+4, RecvPayloadLen-6);
    ret = SendPacket(sd, CmdNum, NO_ERROR, NULL, 0);
    return ret;
}

int CmdSeqReadReg(int sd, uint8_t *buf)
{
    uint8_t CmdNum = buf[0];
    uint16_t RecvPayloadLen = 0;
    uint16_t ReadRegLen = 0;
    int ret = 0;
    GET_UINT16_LE(ReadRegLen, buf, 1);
    GET_UINT16_LE(RecvPayloadLen, buf, 3);
    if ((RecvPayloadLen-2) != 4)
    {
        SendPacket(sd, CmdNum, PAYLOAD_LEN_ERROR, NULL, 0);
        return -1;
    }

    if (RecvBlock(sd, gRecvBuf, RecvPayloadLen) < 0)
        return -1;

#if BYTE_ORDER != LITTLE_ENDIAN
    SwapUint32((uint32_t *)gRecvBuf, (RecvPayloadLen-2)>>2);
#endif

    uint32_t addr = ((uint32_t *)gRecvBuf)[0];
    memcpy(gSendBuf, (void *)addr, ReadRegLen*4);

#if BYTE_ORDER == LITTLE_ENDIAN
    SwapUint32((uint32_t *)gSendBuf, ReadRegLen);
#endif

    ret = SendPacket(sd, CmdNum, NO_ERROR, gSendBuf, ReadRegLen*4);
    return ret;
}

int CmdDebug(int sd, uint8_t *buf)
{
    uint8_t CmdNum = buf[0];
    uint8_t para1 = buf[1];
    uint16_t RecvPayloadLen = 0;
    int ret = 0;
    GET_UINT16_LE(RecvPayloadLen, buf, 3);
    if (RecvPayloadLen != 0)
    {
        SendPacket(sd, CmdNum, PAYLOAD_LEN_ERROR, NULL, 0);
        return -1;
    }

    if (para1 == 0)
    {
        gDebugState = DEBUG_ON;
    }
    else if (para1 == 1)
    {
        gDebugState = DEBUG_OFF;
    }
    else
    {
        ret = SendPacket(sd, CmdNum, PARA1_ERROR, NULL, 0);
        return ret;
    }

    ret = SendPacket(sd, CmdNum, NO_ERROR, NULL, 0);
    return ret;
}

int CmdCfgReg(int sd, uint8_t *buf)
{
    uint8_t CmdNum = buf[0];
    uint16_t RecvPayloadLen = 0;
    int ret = 0;
    GET_UINT16_LE(RecvPayloadLen, buf, 3);
    if ((RecvPayloadLen-2) != REG_TABLE_SIZE_BYTE)
    {
        SendPacket(sd, CmdNum, PAYLOAD_LEN_ERROR, NULL, 0);
        return -1;
    }

    if (RecvBlock(sd, gRecvBuf, RecvPayloadLen) < 0)
        return -1;

#if BYTE_ORDER != LITTLE_ENDIAN
    SwapUint32((uint32_t *)gRecvBuf, (RecvPayloadLen-2)>>2);
#endif

    uint32_t *pTemp = (uint32_t *)gRecvBuf;
    uint32_t mode = pTemp[4] & 0x0F;
    ret = App_RegCfg(gRecvBuf, gSendBuf);
    if (ret != 0)
    {
        SendPacket(sd, CmdNum, CFG_REG_ERROR, NULL, 0);
        return -1;
    }

    if (mode == READ_MODE)
    {
#if BYTE_ORDER != LITTLE_ENDIAN
        SwapUint32((uint32_t *)gSendBuf, READ_DATA_SIZE_INT);
#endif
        ret = SendPacket(sd, CmdNum, NO_ERROR, gSendBuf, READ_DATA_SIZE_BYTE);
    }
    else
    {
        ret = SendPacket(sd, CmdNum, NO_ERROR, NULL, 0);
    }

    return ret;
}

void MapFlowThread(void *arg)
{
    Map_FinderCfg_t FinderCfg = *(Map_FinderCfg_t *)arg;
    AddrArea_t AddrArea = *(AddrArea_t *)(arg + sizeof(FinderCfg));
    int TargetCount = AddrArea.BLCnt * AddrArea.SLCnt;
    gMapThreadRun = 1;
    memcpy(gTargetBuf, arg+sizeof(FinderCfg)+sizeof(AddrArea), TargetCount * 4);
    Map_OperateFlow(&FinderCfg, &AddrArea);
    gMapThreadRun = 0;
    vTaskDelete(NULL);
}

int CmdMapFlow(int sd, uint8_t *buf)
{
    uint8_t CmdNum = buf[0];
    uint16_t RecvPayloadLen = 0;
    int ret = 0;
    GET_UINT16_LE(RecvPayloadLen, buf, 3);
    if (RecvBlock(sd, gRecvBuf, RecvPayloadLen) < 0)
        return -1;

#if BYTE_ORDER != LITTLE_ENDIAN
    SwapUint32((uint32_t *)gRecvBuf, (RecvPayloadLen-2)>>2);
#endif

    if (gMapThreadRun == 0)
    {
        sys_thread_new("MapFlowThread", MapFlowThread, gRecvBuf, THREAD_STACKSIZE, DEFAULT_THREAD_PRIO);
        ret = SendPacket(sd, CmdNum, NO_ERROR, NULL, 0);
    }
    else
    {
        SendPacket(sd, CmdNum, MAP_FLOW_ERROR, NULL, 0);
        ret = -1;
    }

    return ret;
}

int CmdMapProgress(int sd, uint8_t *buf)
{
    uint8_t CmdNum = buf[0];
    uint16_t RecvPayloadLen = 0;
    int ret = 0;
    GET_UINT16_LE(RecvPayloadLen, buf, 3);
    if (RecvPayloadLen != 0)
    {
        SendPacket(sd, CmdNum, PAYLOAD_LEN_ERROR, NULL, 0);
        return -1;
    }

#if BYTE_ORDER != LITTLE_ENDIAN
    SwapUint32((uint32_t *)(&gMapProgress), 1);
#endif

    ret = SendPacket(sd, CmdNum, NO_ERROR, (uint8_t *)(&gMapProgress), 4);
    return ret;
}

int CmdMapAbort(int sd, uint8_t *buf)
{
    uint8_t CmdNum = buf[0];
    uint16_t RecvPayloadLen = 0;
    int ret = 0;
    GET_UINT16_LE(RecvPayloadLen, buf, 3);
    if (RecvPayloadLen != 0)
    {
        SendPacket(sd, CmdNum, PAYLOAD_LEN_ERROR, NULL, 0);
        return -1;
    }

    gMapAbortFlag = 1;
    TickType_t xDelay = pdMS_TO_TICKS(200);

    // 延迟一段时间，等着MAP任务结束
    for (int i = 0; i < 10; i++)
    {
        vTaskDelay(xDelay);
        if (gMapThreadRun == 0)
            break;
    }

    if (gMapThreadRun == 0)
    {
        ret = SendPacket(sd, CmdNum, NO_ERROR, NULL, 0);
    }
    else
    {
        SendPacket(sd, CmdNum, MAP_ABORT_ERROR, NULL, 0);
        ret = -1;
    }

    return ret;
}

int CmdMapResult(int sd, uint8_t *buf)
{
    uint8_t CmdNum = buf[0];
    uint16_t RecvPayloadLen = 0;
    int ret = 0;
    GET_UINT16_LE(RecvPayloadLen, buf, 3);
    if (RecvPayloadLen != 0)
    {
        SendPacket(sd, CmdNum, PAYLOAD_LEN_ERROR, NULL, 0);
        return -1;
    }

#if BYTE_ORDER != LITTLE_ENDIAN
    SwapUint32(gMapResult, CELL_COUNT);
#endif

    ret = SendPacket(sd, CmdNum, NO_ERROR, (uint8_t *)gMapResult, CELL_COUNT * 4);
    return ret;
}

int CmdSeqRead(int sd, uint8_t *buf)
{
    uint8_t CmdNum = buf[0];
    uint8_t para_1 = buf[1]; // BLActive
    uint8_t para_2 = buf[2]; // SLActive
    uint16_t RecvPayloadLen = 0;
    int ret = 0;
    int ArrLen = 0;

    GET_UINT16_LE(RecvPayloadLen, buf, 3);
    ArrLen = (RecvPayloadLen - 2) >> 2;
    if (RecvBlock(sd, gRecvBuf, RecvPayloadLen) < 0)
        return -1;

#if BYTE_ORDER != LITTLE_ENDIAN
    SwapUint32((uint32_t *)gRecvBuf, (RecvPayloadLen-2)>>2);
#endif

    ret = App_SeqRead(para_1, para_2, (uint32_t *)gRecvBuf, (uint32_t *)gSendBuf, ArrLen);

    if (ret == 0)
    {
#if BYTE_ORDER != LITTLE_ENDIAN
        SwapUint32((uint32_t *)gSendBuf, ArrLen);
#endif
        ret = SendPacket(sd, CmdNum, NO_ERROR, gSendBuf, ArrLen * 4);
        return ret;
    }
    else
    {
        SendPacket(sd, CmdNum, SEQ_READ_ERROR, NULL, 0);
        return -1;
    }
}

int CmdSetTarget(int sd, uint8_t *buf)
{
    uint8_t CmdNum = buf[0];
    uint16_t RecvPayloadLen = 0;
    int ret = 0;
    GET_UINT16_LE(RecvPayloadLen, buf, 3);
    if (RecvBlock(sd, gRecvBuf, RecvPayloadLen) < 0)
        return -1;

#if BYTE_ORDER != LITTLE_ENDIAN
    SwapUint32((uint32_t *)gRecvBuf, (RecvPayloadLen-2)>>2);
#endif

    SetFinderCfg_t FinderCfg = *(SetFinderCfg_t *)gRecvBuf;
    AddrArea_t AddrArea = *(AddrArea_t *)(gRecvBuf + sizeof(FinderCfg));
    int TargetCount = AddrArea.BLCnt * AddrArea.SLCnt;
    memcpy(gTargetBuf, gRecvBuf+sizeof(FinderCfg)+sizeof(AddrArea), TargetCount * 4);
    ret = SetTarget(&FinderCfg, &AddrArea);
    if (ret == 0)
    {
#if BYTE_ORDER != LITTLE_ENDIAN
        SwapUint32(gMapResult, CELL_COUNT);
#endif
        ret = SendPacket(sd, CmdNum, NO_ERROR, (uint8_t *)gMapResult, CELL_COUNT * 4);
        return ret;
    }
    else
    {
        SendPacket(sd, CmdNum, SET_TARGET_ERROR, NULL, 0);
        return -1;
    }
}

int CmdResetTarget(int sd, uint8_t *buf)
{
    uint8_t CmdNum = buf[0];
    uint16_t RecvPayloadLen = 0;
    int ret = 0;
    GET_UINT16_LE(RecvPayloadLen, buf, 3);
    if (RecvBlock(sd, gRecvBuf, RecvPayloadLen) < 0)
        return -1;

#if BYTE_ORDER != LITTLE_ENDIAN
    SwapUint32((uint32_t *)gRecvBuf, (RecvPayloadLen-2)>>2);
#endif

    RstFinderCfg_t FinderCfg = *(RstFinderCfg_t *)gRecvBuf;
    AddrArea_t AddrArea = *(AddrArea_t *)(gRecvBuf + sizeof(FinderCfg));
    int TargetCount = AddrArea.BLCnt * AddrArea.SLCnt;
    memcpy(gTargetBuf, gRecvBuf+sizeof(FinderCfg)+sizeof(AddrArea), TargetCount * 4);
    ret = ResetTarget(&FinderCfg, &AddrArea);
    if (ret == 0)
    {
#if BYTE_ORDER != LITTLE_ENDIAN
        SwapUint32(gMapResult, CELL_COUNT);
#endif
        ret = SendPacket(sd, CmdNum, NO_ERROR, (uint8_t *)gMapResult, CELL_COUNT * 4);
        return ret;
    }
    else
    {
        SendPacket(sd, CmdNum, RESET_TARGET_ERROR, NULL, 0);
        return -1;
    }
}

int CmdApplyOp(int sd, uint8_t *buf)
{
    uint8_t CmdNum = buf[0];
    uint16_t RecvPayloadLen = 0;
    int ret = 0;
    GET_UINT16_LE(RecvPayloadLen, buf, 3);
    if (RecvBlock(sd, gRecvBuf, RecvPayloadLen) < 0)
        return -1;

#if BYTE_ORDER != LITTLE_ENDIAN
    SwapUint32((uint32_t *)gRecvBuf, (RecvPayloadLen-2)>>2);
#endif

    ret = ApplyOp((uint32_t *)gRecvBuf);
    if (ret == 0)
    {
        ret = SendPacket(sd, CmdNum, NO_ERROR, NULL, 0);
        return ret;
    }
    else
    {
        SendPacket(sd, CmdNum, APPLY_OP_ERROR, NULL, 0);
        return -1;
    }
}

int CmdOpResult(int sd, uint8_t *buf)
{
    uint8_t CmdNum = buf[0];
    uint16_t RecvPayloadLen = 0;
    int ret = 0;
    GET_UINT16_LE(RecvPayloadLen, buf, 3);

    if (RecvBlock(sd, gRecvBuf, RecvPayloadLen) < 0)
        return -1;

#if BYTE_ORDER != LITTLE_ENDIAN
    SwapUint32((uint32_t *)gRecvBuf, (RecvPayloadLen-2)>>2);
#endif

    uint32_t offset = ((uint32_t *)gRecvBuf)[0];
    uint32_t count = ((uint32_t *)gRecvBuf)[1];

#if BYTE_ORDER != LITTLE_ENDIAN
    SwapUint32(gOpResult + offset, count);
#endif

    ret = SendPacket(sd, CmdNum, NO_ERROR, (uint8_t *)(gOpResult + offset), count * 4);
    return ret;
}

int DisposeReport(int sd)
{
    uint8_t RecvBuf[PACKET_HEAD_LEN-1] = {0};
    int ret = 0;

    if (RecvBlock(sd, RecvBuf, PACKET_HEAD_LEN-1) < 0)
        return -1;

    switch (RecvBuf[0])
    {
    case CMD_CFG_REG:
        ret = CmdCfgReg(sd, RecvBuf);
        break;
    case CMD_MAP_FLOW:
        ret = CmdMapFlow(sd, RecvBuf);
        break;
    case CMD_MAP_PROGRESS:
        ret = CmdMapProgress(sd, RecvBuf);
        break;
    case CMD_MAP_ABORT:
        ret = CmdMapAbort(sd, RecvBuf);
        break;
    case CMD_MAP_RESULT:
        ret = CmdMapResult(sd, RecvBuf);
        break;
    case CMD_SEQ_READ:
        ret = CmdSeqRead(sd, RecvBuf);
        break;
    case CMD_SET_TARGET:
        ret = CmdSetTarget(sd, RecvBuf);
        break;
    case CMD_RESET_TARGET:
        ret = CmdResetTarget(sd, RecvBuf);
        break;
    case CMD_APPLY_OP:
        ret = CmdApplyOp(sd, RecvBuf);
        break;
    case CMD_OP_RESULT:
        ret = CmdOpResult(sd, RecvBuf);
        break;

    case CMD_DEBUG:
        ret = CmdDebug(sd, RecvBuf);
        break;
    case CMD_WRITE_REG:
        ret = CmdWriteReg(sd, RecvBuf);
        break;
    case CMD_READ_REG:
        ret = CmdReadReg(sd, RecvBuf);
        break;
    case CMD_SEQ_WRITE_REG:
        ret = CmdSeqWriteReg(sd, RecvBuf);
        break;
    case CMD_SEQ_READ_REG:
        ret = CmdSeqReadReg(sd, RecvBuf);
        break;
    default:
        ret = SendPacket(sd, CMD_NULL, CMD_NUM_ERROR, NULL, 0);
        break;
    }

    return ret;
}

void CommandProcess(int sd)
{
    uint8_t cmd_head = 0;
    while (1)
    {
        if (RecvBlock(sd, &cmd_head, 1) < 0)
        {
            break;
        }
        else
        {
            if (cmd_head == CMD_HEAD)
            {
                if (DisposeReport(sd) != 0)
                {
                    xil_printf("Dispose Report Error\r\n");
                }
            }
        }
    }
    /* close connection */
    close(sd);
    xil_printf("close connect %d\r\n", sd);
}
