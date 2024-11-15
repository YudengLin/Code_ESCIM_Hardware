#include "app.h"
#include <string.h>
//300ns
uint32_t gMapProgress = 0; // MAP_FLOW的进度，表示当前进行了多少个cell单元，PROGRESS_FINISH_FLAG表示MAP结束
uint32_t gMapAbortFlag = 0; // 1表示终止MAP操作
uint32_t gTargetBuf[CELL_COUNT] = {0};
uint32_t iMapTarget[BL_COUNT][SL_COUNT] = {0};
CompareResult_t iMaskTarget[BL_COUNT][SL_COUNT] = {0};
uint32_t gMapResult[SL_COUNT][BL_COUNT] = {0};
uint32_t gOpResult[40960000] = {0};

uint32_t g_TIA_SL_Table[SL_COUNT] = {
                48, 32, 16, 0, 6, 38, 22, 21, 23, 51, 39, 36, 52, 17, 3, 55,
                50, 20, 19, 35, 5, 34, 1, 4, 54, 2, 18, 37, 53, 33, 49, 7
                };

uint32_t g_TIA_BL_Table[BL_COUNT] = {
                56, 10, 40, 23, 25, 44, 54, 12, 6, 51, 58, 32, 9, 16, 38, 0,
                22, 15, 42, 31, 24, 14, 11, 47, 8, 48, 21, 33, 7, 17, 53, 1,
                39, 30, 55, 63, 57, 61, 60, 46, 26, 50, 20, 62, 5, 18, 52, 34,
                37, 13, 41, 2, 59, 45, 36, 29, 27, 49, 28, 35, 4, 19, 43, 3,
                40, 13, 10, 31, 56, 16, 9, 0, 7, 48, 22, 1, 24, 47, 8, 63, 57,
                15, 42, 62, 39, 17, 41, 14, 6, 32, 21, 46, 43, 49, 23, 29, 25,
                50, 37, 34, 38, 18, 11, 2, 27, 30, 36, 51, 20, 45, 52, 61, 26,
                33, 4, 19, 58, 28, 55, 35, 59, 60, 53, 12, 5, 44, 54, 3
                };

void SetFeedback(int Feedback)
{
    assert_param((Feedback >= 0) && (Feedback <= 3));
    uint32_t RegTemp = 0;
    switch (Feedback)
    {
    case 0:
        RegTemp = 0x0;
        break;

    case 1:
        RegTemp = 0x55555555;
        break;

    case 2:
        RegTemp = 0xAAAAAAAA;
        break;

    case 3:
        RegTemp = 0xFFFFFFFF;
        break;

    default:
        break;
    }
    
    for (int i = 0; i < 4; i++)
    {
        Xil_Out32(REG140_ADDR + i * 4, RegTemp);
    }
}

void SLActiveInputDAC(uint32_t index)
{
    assert_param(index < SL_COUNT);
    uint32_t RegVal = (1 << index);
    Xil_Out32(REG144_ADDR, 0);
    Xil_Out32(REG145_ADDR, RegVal);
}

void WLActiveInputDAC(uint32_t index)
{
    assert_param(index < WL_COUNT);
    uint32_t RegVal = (1 << index);
    Xil_Out32(REG146_ADDR, 0);
    Xil_Out32(REG147_ADDR, RegVal);
}

void BLActiveInputDAC(uint32_t index)
{
    assert_param(index < BL_COUNT);
    uint32_t ValueTemp = (index >> 5);
    uint32_t remainder = (index & 0x1F);
    uint32_t RegVal = (1 << remainder);
    memset((void *)REG148_ADDR, 0, 32);
    Xil_Out32(REG152_ADDR + ValueTemp * 4, RegVal);
}

void SLActiveInputTIA(uint32_t index)
{
    assert_param(index < SL_COUNT);
    uint32_t RegVal = (1 << index);
    Xil_Out32(REG144_ADDR, RegVal);
    Xil_Out32(REG145_ADDR, RegVal);
}

void BLActiveInputTIA(uint32_t index)
{
    assert_param(index < BL_COUNT);
    uint32_t ValueTemp = (index >> 5);
    uint32_t remainder = (index & 0x1F);
    uint32_t RegVal = (1 << remainder);
    memset((void *)REG148_ADDR, 0, 32);
    Xil_Out32(REG148_ADDR + ValueTemp * 4, RegVal);
    Xil_Out32(REG152_ADDR + ValueTemp * 4, RegVal);
}

void SLInputGND(void)
{
    Xil_Out32(REG144_ADDR, 0);
    Xil_Out32(REG145_ADDR, 0);
}

void WLInputGND(void)
{
    Xil_Out32(REG146_ADDR, 0);
    Xil_Out32(REG147_ADDR, 0);
}

void BLInputGND(void)
{
    memset((void *)REG148_ADDR, 0, 32);
}

void ResetBLInput(uint32_t index)
{
    uint32_t ValueTemp = (index >> 5);
    uint32_t remainder = (index & 0x1F);
    memset((void *)REG148_ADDR, 0, 16);
    memset((void *)REG152_ADDR, 0xFF, 16);
    ClearBit(REG152_ADDR + ValueTemp * 4, remainder);
}

int Map_RegCfg(Map_OneCellCfg_t *config, uint32_t MapMode)
{
    assert_param(config->BLVActive < 0x10000);
    assert_param(config->SLVActive < 0x10000);
    assert_param(config->WLVActive < 0x10000);
    assert_param((MapMode > 0) && (MapMode < 4));
    Xil_Out32(REG4_ADDR, MapMode);
    if (MapMode == MAP_SET_FORM)
    {
        BLActiveInputDAC(config->BLActive);
        SLInputGND();
        WLActiveInputDAC(config->WLActive);
    }
    else if(MapMode == MAP_RESET)
    {
        ResetBLInput(config->BLActive);
        SLActiveInputDAC(config->SLActive);
        WLActiveInputDAC(config->WLActive);
    }
    else if(MapMode == MAP_READ)
    {
        if (config->ReadDirection == POSITIVE_READ)
        {
            BLActiveInputDAC(config->BLActive);
            SLActiveInputTIA(config->SLActive);
            WLActiveInputDAC(config->WLActive);
        }
        else
        {
            BLActiveInputTIA(config->BLActive);
            SLActiveInputDAC(config->SLActive);
            WLActiveInputDAC(config->WLActive);
        }
    }
    else
    {
        return -1;
    }

    SetFeedback(config->TIAFeedback);
    Xil_Out32(REG3_ADDR, config->PulseGap);
    Xil_Out32(REG5_ADDR, config->PulseCount);
    Xil_Out32(REG6_ADDR, config->PulseWidth);
    Xil_Out32(REG8_ADDR, (config->BLActive<<16) | config->BLVActive);
    Xil_Out32(REG9_ADDR, ((config->SLActive+BL_COUNT)<<16) | config->SLVActive);
    Xil_Out32(REG10_ADDR, ((config->WLActive+BL_COUNT+SL_COUNT)<<16) | config->WLVActive);
    return 0;
}

float RegToV(uint32_t RegVal)
{
    return (RegVal * 5.0 / 65535.0);
}

int Map_SetRstForm(Map_OneCellCfg_t *config, uint32_t MapMode)
{
    int ret = 0;
    uint32_t TempVal = 0;
    RERAM_Reset();
    Map_RegCfg(config, MapMode);
    ret = POLL_TIMEOUT(Xil_In32, REG0_ADDR, TempVal, (TempVal&COMMON_FINISH_Msk)==0, 2000000);
    if (ret != 0)
        return -1;
    RERAM_Start();
    ret = POLL_TIMEOUT(Xil_In32, REG0_ADDR, TempVal, (TempVal&COMMON_FINISH_Msk)!=0, 2000000);
    if (ret != 0)
        return -1;
    return 0;
}

int Map_Form(Map_OneCellCfg_t *config)
{
    debug("Form %.2f, %.2f, %.2f\r\n", RegToV(config->BLVActive), RegToV(config->SLVActive), RegToV(config->WLVActive));
    return Map_SetRstForm(config, MAP_SET_FORM);
}

int Map_Set(Map_OneCellCfg_t *config)
{
    debug("Set %.2f, %.2f, %.2f\r\n", RegToV(config->BLVActive), RegToV(config->SLVActive), RegToV(config->WLVActive));
    return Map_SetRstForm(config, MAP_SET_FORM);
}

int Map_Reset(Map_OneCellCfg_t *config)
{
    debug("Reset %.2f, %.2f, %.2f\r\n", RegToV(config->BLVActive), RegToV(config->SLVActive), RegToV(config->WLVActive));
    return Map_SetRstForm(config, MAP_RESET);
}


int Map_Read(int BLActive, int SLActive, int ReadDirection, uint32_t ReadV, uint32_t *ReadResult)
{
    Map_OneCellCfg_t config;
    uint32_t regVal = 0;
    uint32_t locate = 0;
    uint32_t remainder = 0;
    int RetTimeout = 0;
    uint32_t TempVal = 0;

    config.BLActive = BLActive;
    config.SLActive = SLActive;
    config.WLActive = SLActive;
    config.TIAFeedback = 3;
    config.PulseWidth = 10000; // PulseWidth * 20ns
    config.PulseGap = 0;
    config.PulseCount = 1;
    config.ReadDirection = ReadDirection;
    if (ReadDirection == POSITIVE_READ)
    {
        config.WLVActive = 0xFFFF;
        config.BLVActive = ReadV;
        config.SLVActive = 0;
    }
    else
    {
        config.WLVActive = 0xFFFF;
        config.BLVActive = 0;
        config.SLVActive = ReadV;
    }

    RERAM_Reset();
    Map_RegCfg(&config, MAP_READ);
    RetTimeout = POLL_TIMEOUT(Xil_In32, REG0_ADDR, TempVal, (TempVal&COMMON_FINISH_Msk)==0, 2000000);
    if (RetTimeout != 0)
        return -1;
    RERAM_Start();
    RetTimeout = POLL_TIMEOUT(Xil_In32, REG0_ADDR, TempVal, (TempVal&COMMON_FINISH_Msk)!=0, 2000000);
    if (RetTimeout != 0)
        return -1;
    if (config.ReadDirection == POSITIVE_READ)
    {
        uint32_t num = g_TIA_SL_Table[config.SLActive];
        locate = num >> 1;
        remainder = num & 1;
    }
    else
    {
        uint32_t num = g_TIA_BL_Table[config.BLActive];
        locate = num >> 1;
        remainder = num & 1;
    }

    regVal = Xil_In32(REG160_ADDR + locate * 4);
    if (remainder == 0)
    {
        *ReadResult = regVal & 0xffff;
    }
    else
    {
        *ReadResult = regVal >> 16;
    }

    return 0;
}

int ReadCompare(Map_OneCellCfg_t *config, uint32_t target, uint32_t ErrorLimit, CompareResult_t *CellStatus)
{
    uint32_t regVal = 0;
    int ret = 0;
    uint32_t ReadV = 0xa3d; // 0.2V

    ret = Map_Read(config->BLActive, config->SLActive, config->ReadDirection, ReadV, &regVal);
    if (ret < 0)
        return -1;
    if (target - ErrorLimit > regVal)
        *CellStatus = LESS_THAN;
    else if (target + ErrorLimit < regVal)
        *CellStatus = GREATER_THAN;
    else
        *CellStatus = WITHIN_SCOPE;
    gMapResult[config->SLActive][config->BLActive] = regVal;
    debug("Read %d, %.3f, %.3f\r\n", *CellStatus, target*5./4095/0.25, regVal*5./4095/0.25);
    return 0;
}

int App_RegCfg(uint8_t RegTable[REG_TABLE_SIZE_BYTE], uint8_t readBuf[READ_DATA_SIZE_BYTE])
{
    uint32_t *pTemp = (uint32_t *)RegTable;
    uint32_t mode = pTemp[4] & 0x0F;
    int ret = 0;
    uint32_t TempVal = 0;
    RERAM_Reset();
    // 不复制前三个寄存器,防止复位没有完成
    memcpy((void *)(BASE_ADDR+12), RegTable+12, REG_TABLE_SIZE_BYTE-12);
    ret = POLL_TIMEOUT(Xil_In32, REG0_ADDR, TempVal, (TempVal&COMMON_FINISH_Msk)==0, 2000000);
    if (ret != 0)
        return -1;
    RERAM_Start();
    ret = POLL_TIMEOUT(Xil_In32, REG0_ADDR, TempVal, (TempVal&COMMON_FINISH_Msk)!=0, 2000000);
    if (ret != 0)
        return -1;
    if (mode == READ_MODE)
    {
        memcpy(readBuf, (void *)REG160_ADDR, READ_DATA_SIZE_BYTE);
    }
    return 0;
}

/*
int TestOp(uint32_t BL, uint32_t SL, Map_FinderCfg_t *FinderCfg)
{
    gMapProgress = 0;
    Map_OneCellCfg_t OneCellCfg;
    CompareResult_t CellStatus;
    OneCellCfg.TIAFeedback = 3;
    OneCellCfg.PulseWidth = 7;
    OneCellCfg.PulseGap = 0;
    OneCellCfg.PulseCount = 1;
    OneCellCfg.ReadDirection = FinderCfg->ReadDirection;
    OneCellCfg.BLActive = BL;
    OneCellCfg.SLActive = SL;
    OneCellCfg.WLActive = SL;
    uint32_t FormVWL = FinderCfg->FormVWLStart;
    uint32_t FormVBL = FinderCfg->FormVBLStart;
    uint32_t SetVWL  = FinderCfg->SetVWLStart;
    uint32_t SetVBL  = FinderCfg->SetVBLStart;
    uint32_t RstVWL  = FinderCfg->RstVWLStart;
    uint32_t RstVSL  = FinderCfg->RstVSLStart;
    for (int i = BL-1; i< BL+2; i++)
    {
        OneCellCfg.PulseWidth = 20;
        OneCellCfg.BLActive = i;
        OneCellCfg.WLVActive = SetVWL;
        OneCellCfg.BLVActive = SetVBL;
        OneCellCfg.SLVActive = 0;
        Map_Set(&OneCellCfg);
        OneCellCfg.WLVActive = RstVWL;
        OneCellCfg.BLVActive = 0;
        OneCellCfg.SLVActive = RstVSL;
        Map_Reset(&OneCellCfg);
        OneCellCfg.PulseWidth = 40;
        OneCellCfg.WLVActive = FormVWL;
        OneCellCfg.BLVActive = FormVBL;
        OneCellCfg.SLVActive = 0;
        Map_Form(&OneCellCfg);
    }
    OneCellCfg.BLActive = BL;
    ReadCompare(&OneCellCfg, gTargetBuf[gMapProgress], FinderCfg->ErrorLimit, &CellStatus);
    for (int i =  SL-1; i< SL+2; i++)
    {
        OneCellCfg.PulseWidth = 20;
        OneCellCfg.SLActive = i;
        OneCellCfg.WLActive = i;
        OneCellCfg.WLVActive = SetVWL;
        OneCellCfg.BLVActive = SetVBL;
        OneCellCfg.SLVActive = 0;
        Map_Set(&OneCellCfg);
        OneCellCfg.WLVActive = RstVWL;
        OneCellCfg.BLVActive = 0;
        OneCellCfg.SLVActive = RstVSL;
        Map_Reset(&OneCellCfg);
        OneCellCfg.PulseWidth = 40;
        OneCellCfg.WLVActive = FormVWL;
        OneCellCfg.BLVActive = FormVBL;
        OneCellCfg.SLVActive = 0;
        Map_Form(&OneCellCfg);
        ReadCompare(&OneCellCfg, gTargetBuf[gMapProgress], FinderCfg->ErrorLimit, &CellStatus);
    }
    OneCellCfg.SLActive = SL;
    OneCellCfg.WLActive = SL;

    printf("Read BL %ld, SL %ld,  %.3f uA, %.3f kohm\r\n", BL, SL, gMapResult[SL][BL]*5./4095/0.25, 200/(gMapResult[SL][BL]*5./4095/0.25+1e-6));

    return 0;
}*/

int Map_OperateFlow(Map_FinderCfg_t *FinderCfg, AddrArea_t *AddrArea)
{
    Map_OneCellCfg_t OneCellCfg;
    CompareResult_t CellStatus;
    OneCellCfg.TIAFeedback = 3;
    OneCellCfg.PulseWidth = 0;
    OneCellCfg.PulseGap = 0;
    OneCellCfg.PulseCount = 1;
    OneCellCfg.ReadDirection = FinderCfg->ReadDirection;
    // uint32_t FormPulseWidth = 0;
    uint32_t SetPulseWidth = 1; // SetPulseWidth * 100ns
    uint32_t ResetPulseWidth = 1;
    int ret = 0;

    gMapAbortFlag = 0;
    gMapProgress = 0;

    /***********************TEST CODE***********************/
    //TestOp(AddrArea->BLStart, AddrArea->SLStart, FinderCfg);
    //return 0;
    

    for (int i = AddrArea->BLStart; i < (AddrArea->BLStart+AddrArea->BLCnt); i++)
    {
        for (int j = AddrArea->SLStart; j < (AddrArea->SLStart+AddrArea->SLCnt); j++)
        {
            OneCellCfg.BLActive = i;
            OneCellCfg.SLActive = j;
            OneCellCfg.WLActive = j;
            // uint32_t FormVWL = FinderCfg->FormVWLStart;
            // uint32_t FormVBL = FinderCfg->FormVBLStart;
            uint32_t SetVWL  = FinderCfg->SetVWLStart;
            uint32_t SetVBL  = FinderCfg->SetVBLStart;
            uint32_t RstVWL  = FinderCfg->RstVWLStart;
            uint32_t RstVSL  = FinderCfg->RstVSLStart;
            // uint32_t Form_flag = 0;
            if (gMapAbortFlag == 1)
            {
                return 0;
            }
            else
            {
                uint32_t Pulse_idx = 0;
                debug("Pulse_idx = %d\r\n", (int)Pulse_idx);
                while (1)
                {
                    ret = ReadCompare(&OneCellCfg, gTargetBuf[gMapProgress], FinderCfg->ErrorLimit, &CellStatus);
                    if (ret != 0)
                        return -1;
                    if(CellStatus == WITHIN_SCOPE) // In the scope, print current
                    {
                        break;
                    }
                    else if(Pulse_idx == FinderCfg->Nmax) // To pulse limit, form or break
                    {
                        break;
                    }
                    else if(CellStatus == LESS_THAN) // Less than target, Set
                    {
                        // GateLast
                        OneCellCfg.WLVActive = SetVWL;
                        OneCellCfg.BLVActive = SetVBL;
                        OneCellCfg.SLVActive = 0;
                        OneCellCfg.PulseWidth = SetPulseWidth;
                        ret = Map_Set(&OneCellCfg);
                        if (ret != 0)
                            return -1;
                        Pulse_idx += 1;
                        SetVBL += FinderCfg->SetVBLStep;
                        if(SetVBL >= FinderCfg->SetVBLEnd)
                        {
                            SetVWL += FinderCfg->SetVWLStep;
                            SetVBL = FinderCfg->SetVBLStart;
                            if(SetVWL>FinderCfg->SetVWLEnd)
                            {
                                SetVBL=FinderCfg->SetVBLEnd;
                                SetVWL=FinderCfg->SetVWLEnd;
                            }
                        } 
                    }
                    else // More than target, Reset
                    {
                        // GateLast
                        OneCellCfg.WLVActive = RstVWL;
                        OneCellCfg.SLVActive = RstVSL;
                        OneCellCfg.BLVActive = 0;
                        OneCellCfg.PulseWidth = ResetPulseWidth;
                        ret = Map_Reset(&OneCellCfg);
                        if (ret != 0)
                            return -1;
                        Pulse_idx += 1;
                        RstVSL += FinderCfg->RstVSLStep;
                        
                        if (RstVSL >= FinderCfg->RstVSLEnd)
                        {
                            RstVWL += FinderCfg->RstVWLStep;
                            RstVSL = FinderCfg->RstVSLStart;
                            if(RstVWL>FinderCfg->RstVWLEnd)
                            {
                                RstVSL=FinderCfg->RstVSLEnd;
                                RstVWL=FinderCfg->RstVWLEnd;
                            }
                        }
                    }
                }
                /*for(int k = 0; k<50; k++)
                {
                    ReadCompare(&OneCellCfg, gTargetBuf[gMapProgress], FinderCfg->ErrorLimit, &CellStatus);
                }*/
            }
            gMapProgress++;
        }
    }
    gMapProgress = PROGRESS_FINISH_FLAG;

    return 0;
}

int App_SeqRead(uint32_t BLActive, uint32_t SLActive, uint32_t *ReadV, uint32_t *ReadResult, int len)
{
    uint32_t ReadDirection = NEGATIVE_READ;

    for (int i = 0; i < len; i++)
    {
        if (Map_Read(BLActive, SLActive, ReadDirection, ReadV[i], ReadResult+i) < 0)
        {
            ERROR_PRINT();
            return -1;
        }
    }

    return 0;
}

int SetTarget(SetFinderCfg_t *FinderCfg, AddrArea_t *AddrArea)
{
    int ret = 0;
    Map_OneCellCfg_t OneCellCfg;
    uint32_t ReadV = 0xa3d; // 0.2V
    uint32_t ReadResult = 0;
    uint32_t progress = 0;

    OneCellCfg.SLVActive = 0;
    OneCellCfg.TIAFeedback = 3;
    OneCellCfg.PulseWidth = 1; //100ns
    OneCellCfg.PulseGap = 0;
    OneCellCfg.PulseCount = 1;
    OneCellCfg.ReadDirection = FinderCfg->ReadDirection;

    for (int i = AddrArea->BLStart; i < (AddrArea->BLStart+AddrArea->BLCnt); i++)
    {
        for (int j = AddrArea->SLStart; j < (AddrArea->SLStart+AddrArea->SLCnt); j++)
        {
            gOpResult[0] = 0;
            OneCellCfg.BLActive = i;
            OneCellCfg.SLActive = j;
            OneCellCfg.WLActive = j;
            uint32_t SetVWL  = FinderCfg->SetVWLStart;
            uint32_t SetVBL  = FinderCfg->SetVBLStart;
            uint32_t PulseIndex = 0;
            while(PulseIndex < FinderCfg->Nmax)
            {
                ret = Map_Read(i, j, OneCellCfg.ReadDirection, ReadV, &ReadResult);
                gOpResult[PulseIndex+1] = ReadResult;
                if (ret != 0)
                    return -1;
                if (ReadResult < gTargetBuf[progress])
                {
                    OneCellCfg.WLVActive = SetVWL;
                    OneCellCfg.BLVActive = SetVBL;
                    ret = Map_Set(&OneCellCfg);
                    if (ret != 0)
                        return -1;
                    PulseIndex += 1;
                    if (FinderCfg->VoltageIncMode == FIRST_INC_BSLV)
                    {
                        SetVBL += FinderCfg->SetVBLStep;
                        if(SetVBL >= FinderCfg->SetVBLEnd)
                        {
                            SetVWL += FinderCfg->SetVWLStep;
                            SetVBL = FinderCfg->SetVBLStart;
                            if(SetVWL > FinderCfg->SetVWLEnd)
                            {
                                SetVBL = FinderCfg->SetVBLEnd;
                                SetVWL = FinderCfg->SetVWLEnd;
                            }
                        } 
                    }
                    else
                    {
                        SetVWL += FinderCfg->SetVWLStep;
                        if(SetVWL >= FinderCfg->SetVWLEnd)
                        {
                            SetVBL += FinderCfg->SetVBLStep;
                            SetVWL = FinderCfg->SetVWLStart;
                            if(SetVBL > FinderCfg->SetVBLEnd)
                            {
                                SetVBL = FinderCfg->SetVBLEnd;
                                SetVWL = FinderCfg->SetVWLEnd;
                            }
                        }
                    }
                }
                else
                {
                    gMapResult[i][j] = ReadResult;

                    break;
                }
                
            }
            gOpResult[0] = PulseIndex;
        }
    }

    return 0;
}

int ResetTarget(RstFinderCfg_t *FinderCfg, AddrArea_t *AddrArea)
{
    int ret = 0;
    Map_OneCellCfg_t OneCellCfg;
    uint32_t ReadV = 0xa3d; // 0.2V
    uint32_t ReadResult = 0;
    uint32_t progress = 0;

    OneCellCfg.BLVActive = 0;
    OneCellCfg.TIAFeedback = 3;
    OneCellCfg.PulseWidth = 1;
    OneCellCfg.PulseGap = 0;
    OneCellCfg.PulseCount = 1;
    OneCellCfg.ReadDirection = FinderCfg->ReadDirection;


    for (int i = AddrArea->BLStart; i < (AddrArea->BLStart+AddrArea->BLCnt); i++)
    {
        for (int j = AddrArea->SLStart; j < (AddrArea->SLStart+AddrArea->SLCnt); j++)
        {
            gOpResult[0] = 0;
            OneCellCfg.BLActive = i;
            OneCellCfg.SLActive = j;
            OneCellCfg.WLActive = j;
            uint32_t RstVWL  = FinderCfg->RstVWLStart;
            uint32_t RstVSL  = FinderCfg->RstVSLStart;
            uint32_t PulseIndex = 0;
            while(PulseIndex < FinderCfg->Nmax)
            {
                ret = Map_Read(i, j, OneCellCfg.ReadDirection, ReadV, &ReadResult);
                gOpResult[PulseIndex+1] = ReadResult;
                if (ret != 0)
                    return -1;
                if (ReadResult > gTargetBuf[progress])
                {
                    OneCellCfg.WLVActive = RstVWL;
                    OneCellCfg.SLVActive = RstVSL;
                    ret = Map_Reset(&OneCellCfg);
                    if (ret != 0)
                        return -1;
                    PulseIndex += 1;
                    if (FinderCfg->VoltageIncMode == FIRST_INC_BSLV)
                    {
                        RstVSL += FinderCfg->RstVSLStep;
                        if(RstVSL >= FinderCfg->RstVSLEnd)
                        {
                            RstVWL += FinderCfg->RstVWLStep;
                            RstVSL = FinderCfg->RstVSLStart;
                            if(RstVWL > FinderCfg->RstVWLEnd)
                            {
                                RstVSL = FinderCfg->RstVSLEnd;
                                RstVWL = FinderCfg->RstVWLEnd;
                            }
                        } 
                    }
                    else
                    {
                        RstVWL += FinderCfg->RstVWLStep;
                        if(RstVWL >= FinderCfg->RstVWLEnd)
                        {
                            RstVSL += FinderCfg->RstVSLStep;
                            RstVWL = FinderCfg->RstVWLStart;
                            if(RstVSL > FinderCfg->RstVSLEnd)
                            {
                                RstVSL = FinderCfg->RstVSLEnd;
                                RstVWL = FinderCfg->RstVWLEnd;
                            }
                        }
                    }
                }
                else
                {
                    gMapResult[i][j] = ReadResult;

                    break;
                }
            }
            gOpResult[0] = PulseIndex;
        }
    }

    return 0;
}

int FormOp(MapCfg_t *mapCfg)
{
    uint32_t VoltageIncMode = FIRST_INC_WLV;
    Map_OneCellCfg_t OneCellCfg;
    OneCellCfg.SLVActive = 0;
    OneCellCfg.TIAFeedback = 3;
    OneCellCfg.PulseWidth = mapCfg->PulseWidth; //100ns
    OneCellCfg.PulseGap = 0;
    OneCellCfg.PulseCount = 1;
    OneCellCfg.ReadDirection = NEGATIVE_READ;

    mapCfg->ReadV = 0xa3d; // 0.2V
    uint32_t ReadResult = 0;
    // uint32_t progress = 0;
    uint32_t cellIndex = 0;
    uint32_t CellPass = 0;
    int ret = 0;

    for (int i = mapCfg->BLStart; i < (mapCfg->BLStart + mapCfg->BLCnt); i++)
    {
        for (int j = mapCfg->SLStart; j < (mapCfg->SLStart + mapCfg->SLCnt); j++)
        {
            CellPass = 0;
            //gOpResult[0] = 0;
            OneCellCfg.BLActive = i;
            OneCellCfg.SLActive = j;
            OneCellCfg.WLActive = j;
            uint32_t FormVWL = mapCfg->FormVWLStart;
            uint32_t FormVBL = mapCfg->FormVBLStart;
            uint32_t PulseIndex = 0;

            while (PulseIndex < mapCfg->PulseMax)
            {

                ret = Map_Read(i, j, OneCellCfg.ReadDirection, mapCfg->ReadV, &ReadResult);
                gOpResult[PulseIndex + 1 + 1000 * cellIndex] = ReadResult;
                if (ret != 0)
                    return -1;
                if (ReadResult < mapCfg->ITarget)
                {
                    OneCellCfg.WLVActive = FormVWL;
                    OneCellCfg.BLVActive = FormVBL;
                    ret = Map_Set(&OneCellCfg);
                    if (ret != 0)
                        return -1;
                    PulseIndex += 1;
                    if (VoltageIncMode == FIRST_INC_BSLV)
                    {
                        FormVBL += mapCfg->FormVBLStep;
                        if (FormVBL >= mapCfg->FormVBLEnd)
                        {
                            FormVWL += mapCfg->FormVWLStep;
                            FormVBL = mapCfg->FormVBLEnd;
                        }
                        if (FormVWL > mapCfg->FormVWLEnd)
                        {
                            FormVBL = mapCfg->FormVBLEnd;
                            FormVWL = mapCfg->FormVWLEnd;
                        }
                    }
                    else
                    {
                        FormVWL += mapCfg->FormVWLStep;
                        if (FormVWL >= mapCfg->FormVWLEnd)
                        {
                            FormVBL += mapCfg->FormVBLStep;
                            FormVWL = mapCfg->FormVWLStart;
                        }
                        if (FormVBL > mapCfg->FormVBLEnd)
                        {
                            FormVBL = mapCfg->FormVBLEnd;
                            FormVWL = mapCfg->FormVWLEnd;
                        }
                    }
                }
                else
                {
                    gMapResult[i][j] = ReadResult;
                    CellPass = 1;

                    break;
                }
            }
//gOpResult[1000 * cellIndex] = PulseIndex;
            cellIndex += 1;
            if(CellPass==1)
            {
                xil_printf("Pass: %d, %d\n",i,j);
            }
            else
            {
                xil_printf("Fail: %d, %d\n",i,j);
            }

        }
    }
    return 0;
}

int MapOp(MapCfg_t *mapCfg)
{
    uint32_t VoltageIncMode = FIRST_INC_WLV;

    Map_OneCellCfg_t OneCellCfg;
    
    OneCellCfg.TIAFeedback = 3;
    OneCellCfg.PulseWidth = mapCfg->PulseWidth; //100ns
    OneCellCfg.PulseGap = 0;
    OneCellCfg.PulseCount = 1;
    OneCellCfg.ReadDirection = NEGATIVE_READ;

    mapCfg->ReadV = 0xa3d; // 0.2V
    uint32_t ReadResult = 0;
    // uint32_t progress = 0;
    uint32_t cellIndex = 0;
    int ret = 0;

    uint32_t RdOffset = 100*4096;

    for (int i = mapCfg->BLStart; i < (mapCfg->BLStart+mapCfg->BLCnt); i++)
    {
        for (int j = mapCfg->SLStart; j < (mapCfg->SLStart+mapCfg->SLCnt); j++)
        {
            uint32_t iMax = iMapTarget[i][j] + mapCfg->Errorbar;
            uint32_t iMin = iMapTarget[i][j] - mapCfg->Errorbar;
            OneCellCfg.BLActive = i;
            OneCellCfg.SLActive = j;
            OneCellCfg.WLActive = j;
            //uint32_t FormVWL  = mapCfg->SetVWLStart;
            //uint32_t FormVBL  = mapCfg->SetVBLStart;
            uint32_t SetVWL  = mapCfg->SetVWLStart;
            uint32_t SetVBL  = mapCfg->SetVBLStart;
            uint32_t RstVWL  = mapCfg->RstVWLStart;
            uint32_t RstVSL  = mapCfg->RstVSLStart;
            uint32_t PulseIndex = 0;
            
            while(PulseIndex < mapCfg->PulseMax)
            {
                ret = Map_Read(i, j, OneCellCfg.ReadDirection, mapCfg->ReadV, &ReadResult);
                gOpResult[RdOffset+PulseIndex+2+1000*cellIndex] = ReadResult;
                if (ret != 0)
                    return -1;
                if (ReadResult < iMin)
                {
                    OneCellCfg.WLVActive = SetVWL;
                    OneCellCfg.BLVActive = SetVBL;
                    OneCellCfg.SLVActive = 0;
                    ret = Map_Set(&OneCellCfg);
                    if (ret != 0)
                        return -1;
                    PulseIndex += 1;
                    if (VoltageIncMode == FIRST_INC_BSLV)
                    {
                        SetVBL +=  mapCfg->SetVBLStep;
                        if(SetVBL >=  mapCfg->SetVBLEnd)
                        {
                            SetVWL +=  mapCfg->SetVWLStep;
                            SetVBL =  mapCfg->SetVBLEnd;
                        } 
                        if(SetVWL >  mapCfg->SetVWLEnd)
                        {
                            SetVBL =  mapCfg->SetVBLEnd;
                            SetVWL =  mapCfg->SetVWLEnd;
                        }
                    }
                    else
                    {
                        SetVWL +=  mapCfg->SetVWLStep;
                        if(SetVWL >=  mapCfg->SetVWLEnd)
                        {
                            SetVBL +=  mapCfg->SetVBLStep;
                            SetVWL =  mapCfg->SetVWLStart;
                        }
                        if(SetVBL >  mapCfg->SetVBLEnd)
                        {
                            SetVBL = mapCfg->SetVBLEnd;
                            SetVWL = mapCfg->SetVWLEnd;
                        }
                    }
                }
                else if (ReadResult > iMax)
                {
                    OneCellCfg.WLVActive = RstVWL;
                    OneCellCfg.BLVActive = 0;
                    OneCellCfg.SLVActive = RstVSL;
                    ret = Map_Reset(&OneCellCfg);
                    if (ret != 0)
                        return -1;
                    PulseIndex += 1;
                    if (VoltageIncMode == FIRST_INC_BSLV)
                    {
                        RstVSL +=  mapCfg->RstVSLStep;
                        if(RstVSL >=  mapCfg->RstVSLEnd)
                        {
                            RstVWL +=  mapCfg->RstVWLStep;
                            RstVSL =  mapCfg->RstVSLEnd;
                        } 
                        if(RstVWL >  mapCfg->RstVWLEnd)
                        {
                            RstVSL =  mapCfg->RstVSLEnd;
                            RstVWL =  mapCfg->RstVWLEnd;
                        }
                    }
                    else
                    {
                        RstVWL += mapCfg->RstVWLStep;
                        if(RstVWL >=  mapCfg->RstVWLEnd)
                        {
                            RstVSL +=  mapCfg->RstVSLStep;
                            RstVWL =  mapCfg->RstVWLStart;
                        }
                        if(RstVSL >  mapCfg->RstVSLEnd)
                        {
                            RstVSL = mapCfg->RstVSLEnd;
                            RstVWL = mapCfg->RstVWLEnd;
                        }
                    }
                }
                else
                {
                    gOpResult[cellIndex*10] = ReadResult;
                    for (size_t k = 0; k < 9; k++)
                    {
                        ret = Map_Read(i, j, OneCellCfg.ReadDirection, mapCfg->ReadV, &ReadResult);
                        if (ret != 0) return -1;
                        gOpResult[cellIndex*10+k+1] = ReadResult;
                    }
                    break;
                }
                if(PulseIndex==mapCfg->PulseMax-1)
                {
                    gOpResult[cellIndex*10] = ReadResult;
                    for (size_t k = 0; k < 9; k++)
                    {
                        ret = Map_Read(i, j, OneCellCfg.ReadDirection, mapCfg->ReadV, &ReadResult);
                        if (ret != 0) return -1;
                        gOpResult[cellIndex*10+k+1] = ReadResult;
                    }
                    break;
                }
            }
            gOpResult[RdOffset+1000*cellIndex+1] = PulseIndex;
            cellIndex += 1;

        }
        xil_printf("Finish: %d row\n",i);
    }
    return 0;
}

void SetInputA0(uint32_t number, uint32_t InputMode, uint32_t AddrBase)
{
    uint32_t *addr = (uint32_t *)AddrBase;
    (InputMode & 1) ? (SetBit(addr[0], number)) : (ClearBit(addr[0], number));
}

void SetInputA1(uint32_t number, uint32_t InputMode, uint32_t AddrBase)
{
    uint32_t *addr = (uint32_t *)AddrBase;
    ((InputMode>>1) & 1) ? (SetBit(addr[0], number)) : (ClearBit(addr[0], number));
}

void SetBLInputSwitch(uint32_t SwitchValue[BL_COUNT])
{
    int count = 0;
    int remainder = 0;
    int ValueTemp = 0;
    for (; count < BL_COUNT; count++)
    {
        ValueTemp = (count >> 5);
        remainder = (count & 0x1F);
        SetInputA1(remainder, SwitchValue[count], REG148_ADDR + 4*ValueTemp);
        SetInputA0(remainder, SwitchValue[count], REG152_ADDR + 4*ValueTemp);
    }
}

void SetSLInputSwitch(uint32_t SwitchValue[SL_COUNT])
{
    int count = 0;
    for (; count < SL_COUNT; count++)
    {
        SetInputA1(count, SwitchValue[count], REG144_ADDR);
        SetInputA0(count, SwitchValue[count], REG145_ADDR);
    }
}

void SetWLInputSwitch(uint32_t SwitchValue[WL_COUNT])
{
    int count = 0;
    for (; count < WL_COUNT; count++)
    {
        SetInputA1(count, SwitchValue[count], REG146_ADDR);
        SetInputA0(count, SwitchValue[count], REG147_ADDR);
    }
}

int Parallel_RegCfg(Parallel_CellCfg_t *config, uint32_t MapMode)
{
    assert_param(config->BLVActive < 0x10000);
    assert_param(config->SLVActive < 0x10000);
    assert_param(config->WLVActive < 0x10000);
    assert_param((MapMode > 0) && (MapMode < 4));
    Xil_Out32(REG4_ADDR, MapMode);
    SetBLInputSwitch(config->BLInput);
    SetSLInputSwitch(config->SLInput);
    SetWLInputSwitch(config->WLInput);
    SetFeedback(config->TIAFeedback);
    Xil_Out32(REG3_ADDR, config->PulseGap);
    Xil_Out32(REG5_ADDR, config->PulseCount);
    Xil_Out32(REG6_ADDR, config->PulseWidth);
    Xil_Out32(REG8_ADDR, config->BLVActive);
    Xil_Out32(REG9_ADDR, ((config->SLActive+BL_COUNT)<<16) | config->SLVActive);
    Xil_Out32(REG10_ADDR, ((config->SLActive+BL_COUNT+SL_COUNT)<<16) | config->WLVActive);
    return 0;
}

void SpecifySort(uint16_t RegArr[TIA_COUNT], uint32_t LatterHalfFlag)
{
    uint32_t TempArr_1[READ_DATA_SIZE_INT];
    uint16_t TempArr_2[TIA_COUNT];
    memcpy(TempArr_1, (void *)REG160_ADDR, READ_DATA_SIZE_BYTE);
    for (int i=0; i<READ_DATA_SIZE_INT; i++)
    {
        TempArr_2[2 * i] = TempArr_1[i] & 0xffff;
        TempArr_2[2 * i + 1] = TempArr_1[i] >> 16;
    }

    if (LatterHalfFlag == 0)
    {
        for (int i=0; i<TIA_COUNT; i++)
        {
            uint32_t index = g_TIA_BL_Table[i];
            RegArr[i] = TempArr_2[index];
        }
    }
    else
    {
        for (int i=0; i<TIA_COUNT; i++)
        {
            uint32_t index = g_TIA_BL_Table[i + TIA_COUNT];
            RegArr[i] = TempArr_2[index];
        }
    }
}

int Parallel_Read(uint32_t SLActive, uint32_t ReadV, uint16_t ReadResult[BL_COUNT])
{
    Parallel_CellCfg_t config;
    int RetTimeout = 0;
    uint32_t TempVal = 0;
    uint32_t BLInput[BL_COUNT] = {0};
    uint32_t SLInput[SL_COUNT] = {0};
    uint32_t WLInput[WL_COUNT] = {0};

    config.BLInput = BLInput;
    config.SLInput = SLInput;
    config.WLInput = WLInput;
    config.SLActive = SLActive;
    config.TIAFeedback = 3;
    config.PulseWidth = 10000; // PulseWidth * 20ns
    config.PulseGap = 0;
    config.PulseCount = 1;
    config.WLVActive = 0xFFFF;
    config.BLVActive = 0;
    config.SLVActive = ReadV;
    SLInput[SLActive] = DAC_SWITCH;
    WLInput[SLActive] = DAC_SWITCH;

    for (uint32_t cycle=0; cycle<2; cycle++)
    {
        memset(BLInput, 0, BL_COUNT*4);
        for (int i=0; i<TIA_COUNT; i++)
        {
            BLInput[i + cycle * TIA_COUNT] = TIA_SWITCH;
        }

        RERAM_Reset();
        Parallel_RegCfg(&config, MAP_READ);
        RetTimeout = POLL_TIMEOUT(Xil_In32, REG0_ADDR, TempVal, (TempVal&COMMON_FINISH_Msk)==0, 2000000);
        if (RetTimeout != 0)
            return -1;
        RERAM_Start();
        RetTimeout = POLL_TIMEOUT(Xil_In32, REG0_ADDR, TempVal, (TempVal&COMMON_FINISH_Msk)!=0, 2000000);
        if (RetTimeout != 0)
            return -1;

        SpecifySort(ReadResult + cycle * TIA_COUNT, cycle);
    }

    return 0;
}

int Parallel_SetRstForm(Parallel_CellCfg_t *config, uint32_t MapMode)
{
    int ret = 0;
    uint32_t TempVal = 0;
    RERAM_Reset();
    Parallel_RegCfg(config, MapMode);
    ret = POLL_TIMEOUT(Xil_In32, REG0_ADDR, TempVal, (TempVal&COMMON_FINISH_Msk)==0, 2000000);
    if (ret != 0)
        return -1;
    RERAM_Start();
    ret = POLL_TIMEOUT(Xil_In32, REG0_ADDR, TempVal, (TempVal&COMMON_FINISH_Msk)!=0, 2000000);
    if (ret != 0)
        return -1;
    return 0;
}

int Parallel_Form(Parallel_CellCfg_t *config)
{
    debug("Form %.2f, %.2f, %.2f\r\n", RegToV(config->BLVActive), RegToV(config->SLVActive), RegToV(config->WLVActive));
    return Parallel_SetRstForm(config, MAP_SET_FORM);
}

int Parallel_Set(Parallel_CellCfg_t *config)
{
    debug("Set %.2f, %.2f, %.2f\r\n", RegToV(config->BLVActive), RegToV(config->SLVActive), RegToV(config->WLVActive));
    return Parallel_SetRstForm(config, MAP_SET_FORM);
}

int Parallel_Reset(Parallel_CellCfg_t *config)
{
    debug("Reset %.2f, %.2f, %.2f\r\n", RegToV(config->BLVActive), RegToV(config->SLVActive), RegToV(config->WLVActive));
    return Parallel_SetRstForm(config, MAP_RESET);
}

int ParallelColMapOp(uint32_t BLStart, uint32_t BLCnt, uint32_t SLStart, uint32_t SLCnt,MapCfg_t *mapCfg)
{
    assert_param(SLCnt==1);
    uint32_t SetVWL = mapCfg->SetVWLStart;
    uint32_t SetVBL = mapCfg->SetVBLStart;
    uint32_t RstVWL = mapCfg->RstVWLStart;
    uint32_t RstVSL = mapCfg->RstVSLStart;
    uint32_t BLInput[BL_COUNT] = {0};
    uint32_t SLInput[SL_COUNT] = {0};
    uint32_t WLInput[WL_COUNT] = {0};

    Parallel_CellCfg_t *parCfg = {0};
    parCfg->BLInput = BLInput;
    parCfg->SLInput = SLInput;
    parCfg->WLInput = WLInput;
    parCfg->SLActive = SLStart;
    parCfg->PulseWidth = 1;
    parCfg->PulseGap = 0;
    parCfg->PulseCount = 1;
    parCfg->ReadDirection = NEGATIVE_READ;
    parCfg->TIAFeedback = mapCfg->TIAFeedback;

    uint32_t PulseIndex = 0;
    uint32_t NCellPass = 0;
    uint16_t ReadResult[BL_COUNT] = {0};

    while(PulseIndex < mapCfg->PulseMax)
    {
        NCellPass = 0;
        Parallel_Read(SLStart, mapCfg->ReadV, ReadResult);
        for(int i=0; i< BLCnt; i++)
        {
            if(iMapTarget[BLStart+i][SLStart]<(ReadResult[BLStart+i]-mapCfg->Errorbar)) iMaskTarget[BLStart+i][SLStart]=LESS_THAN;
            else if(iMapTarget[BLStart+i][SLStart]>(ReadResult[BLStart+i]+mapCfg->Errorbar)) iMaskTarget[BLStart+i][SLStart]=GREATER_THAN;
            else {iMaskTarget[BLStart+i][SLStart]=WITHIN_SCOPE; NCellPass += 1;}
        }
        if (NCellPass == BLCnt) break;
        // Parallel SET
        parCfg->BLVActive = SetVBL;
        parCfg->SLVActive = 0;
        parCfg->WLVActive = SetVWL;
        memset(parCfg->SLInput, 0, SL_COUNT*4);
        memset(parCfg->WLInput, 0, WL_COUNT*4);
        parCfg->SLInput[SLStart] = GND_SWITCH;
        parCfg->WLInput[SLStart] = DAC_SWITCH;
        for (int i=0; i<BL_COUNT; i++)
        {
            if ((i>=BLStart) && (i<BLStart+BLCnt) && (iMaskTarget[i][SLStart]==LESS_THAN))
            {
                parCfg->BLInput[i] = DAC_SWITCH;
            }
            else
            {
                parCfg->BLInput[i] = GND_SWITCH;
            }
        }

        Parallel_Set(parCfg);
        // Parallel RESET
        parCfg->BLVActive = 0;
        parCfg->SLVActive = RstVSL;
        parCfg->WLVActive = RstVWL;
        memset(parCfg->SLInput, 0, SL_COUNT*4);
        memset(parCfg->WLInput, 0, WL_COUNT*4);
        parCfg->SLInput[SLStart] = DAC_SWITCH;
        parCfg->WLInput[SLStart] = DAC_SWITCH;
        for (int i=0; i<BL_COUNT; i++)
        {
            if ((i>=BLStart) && (i<BLStart+BLCnt) && (iMaskTarget[i][SLStart]==GREATER_THAN))
            {
                parCfg->BLInput[i] = GND_SWITCH;
            }
            else
            {
                parCfg->BLInput[i] = DAC_SWITCH;
            }
        }

        Parallel_Reset(parCfg);

        PulseIndex += 1;
    }
    return 0;
}

int ParallelBlockMapOp(uint32_t iBLProg, uint32_t iSLProg, uint32_t NBLPar, uint32_t NSLPar, MapCfg_t *mapCfg)
{
    uint32_t BLStart = iBLProg*mapCfg->BLPar + mapCfg->BLStart;
    uint32_t SLStart = iSLProg*mapCfg->SLPar + mapCfg->SLStart;
    // Col-by-Col Programming
    for(int i=0; i< NSLPar; i++)
    {
        ParallelColMapOp(BLStart, mapCfg->BLPar, SLStart, 1, mapCfg);
    }

    // Fully Parallel Programming TODO

    return 0;
}

int ParallelMapOp(MapCfg_t *mapCfg)
{
    uint32_t NBLProg = mapCfg->BLCnt/mapCfg->BLPar;
    uint32_t NSLProg = mapCfg->SLCnt/mapCfg->SLPar;
    uint32_t NBLProgRes = mapCfg->BLCnt%mapCfg->BLPar;
    uint32_t NSLProgRes = mapCfg->SLCnt%mapCfg->SLPar;

    for(int i=0; i< NBLProg; i++)
    {
        for(int j=0; j < NSLProg; j++)
        {
            ParallelBlockMapOp(i, j, mapCfg->BLPar, mapCfg->SLPar, mapCfg);
        }
    }
    if (!(NBLProgRes==0))
    {
        for(int j=0; j < NSLProg; j++)
            ParallelBlockMapOp(NBLProg, j, NBLProgRes, mapCfg->SLPar, mapCfg);
    }
    if (!(NSLProgRes==0))
    {
        for(int i=0; i < NBLProg; i++)
            ParallelBlockMapOp(i, NSLProg, mapCfg->BLPar, NSLProgRes, mapCfg);
    }
    if (!(NSLProgRes==0)&!(NBLProgRes==0))
    {
        ParallelBlockMapOp(NBLProg, NSLProg, NBLProgRes, NSLProgRes, mapCfg);
    }
    return 0;
}


int ApplyOp(uint32_t *opConfig)
{
    gMapAbortFlag=0;
    if(opConfig[0] == 0) // Read
    {
        uint32_t BLStart = opConfig[1];
        uint32_t BLCnt = opConfig[2];
        uint32_t SLStart = opConfig[3];
        uint32_t SLCnt = opConfig[4];
        uint32_t ReadCnt = opConfig[5];
        uint32_t ReadV = 0xa3d;
        for (int i=BLStart; i< BLStart+BLCnt; i++)
        {
            for (int j=SLStart; j< SLStart+SLCnt; j++)
            {
                for (int k=0; k< ReadCnt; k++)
                {
                    if (gMapAbortFlag==0)
                    {
                        Map_Read(i, j, NEGATIVE_READ, ReadV, &gOpResult[i*SLCnt+j*ReadCnt+k]);
                        xil_printf("%d\n",k);
                    }
                }
            }
            xil_printf("Finish: %d row\n",i);
        }
    }
    else if (opConfig[0] == 1) // Form
    {
        MapCfg_t mapCfg; 
        mapCfg.BLStart = opConfig[1];
        mapCfg.BLCnt = opConfig[2];
        mapCfg.SLStart = opConfig[3];
        mapCfg.SLCnt = opConfig[4];
        mapCfg.PulseWidth = opConfig[5];
        mapCfg.PulseMax = opConfig[6];
        mapCfg.ReadV = opConfig[7]; //0xa3d;
        mapCfg.FormVWLStart = opConfig[8]; 
        mapCfg.FormVWLStep = opConfig[9]; 
        mapCfg.FormVWLEnd = opConfig[10]; 
        mapCfg.FormVBLStart = opConfig[11]; 
        mapCfg.FormVBLStep = opConfig[12]; 
        mapCfg.FormVBLEnd = opConfig[13];
        mapCfg.ITarget = opConfig[14];
        FormOp(&mapCfg);
    }
    else if (opConfig[0] == 2) // Set
    {
    }
    else if (opConfig[0] == 3) // Reset
    {
        /* code */
    }
    else if (opConfig[0] == 4) // Mapping
    {
        MapCfg_t mapCfg; 
        mapCfg.BLStart = opConfig[1];
        mapCfg.BLCnt = opConfig[2];
        mapCfg.SLStart = opConfig[3];
        mapCfg.SLCnt = opConfig[4];
        mapCfg.PulseWidth = opConfig[5];
        mapCfg.PulseMax = opConfig[6];
        mapCfg.ReadV = opConfig[7]; //0xa3d;
        mapCfg.FormVWLStart = opConfig[8];
        mapCfg.FormVWLStep = opConfig[9];
        mapCfg.FormVWLEnd = opConfig[10];
        mapCfg.FormVBLStart = opConfig[11];
        mapCfg.FormVBLStep = opConfig[12];
        mapCfg.FormVBLEnd = opConfig[13];
        mapCfg.SetVWLStart = opConfig[14];
        mapCfg.SetVWLStep = opConfig[15];
        mapCfg.SetVWLEnd = opConfig[16];
        mapCfg.SetVBLStart = opConfig[17];
        mapCfg.SetVBLStep = opConfig[18];
        mapCfg.SetVBLEnd = opConfig[19];
        mapCfg.RstVWLStart = opConfig[20];
        mapCfg.RstVWLStep = opConfig[21];
        mapCfg.RstVWLEnd = opConfig[22];
        mapCfg.RstVSLStart = opConfig[23];
        mapCfg.RstVSLStep = opConfig[24];
        mapCfg.RstVSLEnd = opConfig[25];
        mapCfg.Errorbar = opConfig[26];
        for (size_t i = 0; i < mapCfg.BLCnt; i++)
        {
            for (size_t j = 0; j < mapCfg.SLCnt; j++)
            {
                iMapTarget[mapCfg.BLStart+i][mapCfg.SLStart+j] = opConfig[27+i*mapCfg.SLCnt+j];
            }
        }
        MapOp(&mapCfg);
    }
    else if (opConfig[0] == 5) // Parallel Mapping
    {
        MapCfg_t mapCfg;
        mapCfg.BLStart = opConfig[1];
        mapCfg.BLCnt = opConfig[2];
        mapCfg.SLStart = opConfig[3];
        mapCfg.SLCnt = opConfig[4];
        mapCfg.PulseWidth = opConfig[5];
        mapCfg.PulseMax = opConfig[6];
        mapCfg.ReadV = opConfig[7]; //0xa3d;
        mapCfg.FormVWLStart = opConfig[8];
        mapCfg.FormVWLStep = opConfig[9];
        mapCfg.FormVWLEnd = opConfig[10];
        mapCfg.FormVBLStart = opConfig[11];
        mapCfg.FormVBLStep = opConfig[12];
        mapCfg.FormVBLEnd = opConfig[13];
        mapCfg.SetVWLStart = opConfig[14];
        mapCfg.SetVWLStep = opConfig[15];
        mapCfg.SetVWLEnd = opConfig[16];
        mapCfg.SetVBLStart = opConfig[17];
        mapCfg.SetVBLStep = opConfig[18];
        mapCfg.SetVBLEnd = opConfig[19];
        mapCfg.RstVWLStart = opConfig[20];
        mapCfg.RstVWLStep = opConfig[21];
        mapCfg.RstVWLEnd = opConfig[22];
        mapCfg.RstVSLStart = opConfig[23];
        mapCfg.RstVSLStep = opConfig[24];
        mapCfg.RstVSLEnd = opConfig[25];
        mapCfg.Errorbar = opConfig[26];
        mapCfg.BLPar = opConfig[27];
        mapCfg.SLPar = opConfig[28];
        for (size_t i = 0; i < mapCfg.BLCnt; i++)
        {
            for (size_t j = 0; j < mapCfg.SLCnt; j++)
            {
                iMapTarget[mapCfg.BLStart+i][mapCfg.SLStart+j] = opConfig[29+i*mapCfg.SLCnt+j];
            }
        }
        ParallelMapOp(&mapCfg);
    }
    else if (opConfig[0] == 6) // Mapping TODO
    {}
    else if (opConfig[0] == 7) // Mapping TODO
    {}
    else if (opConfig[0] == 8) // Mapping TODO
    {}
    
    return 0;
}


