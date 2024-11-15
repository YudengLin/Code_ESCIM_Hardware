#ifndef APP_H_
#define APP_H_

#include <stdint.h>
#include "xil_io.h"
#include "func_lab.h"

#define REG_TABLE_SIZE_INT 156
#define REG_TABLE_SIZE_BYTE (REG_TABLE_SIZE_INT * 4)

#define READ_DATA_SIZE_INT 32
#define READ_DATA_SIZE_BYTE (READ_DATA_SIZE_INT * 4)

#define BASE_ADDR 0x43C00000

#define REG0_ADDR BASE_ADDR
#define REG1_ADDR (BASE_ADDR + 1*4)
#define REG2_ADDR (BASE_ADDR + 2*4)
#define REG3_ADDR (BASE_ADDR + 3*4)
#define REG4_ADDR (BASE_ADDR + 4*4)
#define REG5_ADDR (BASE_ADDR + 5*4)
#define REG6_ADDR (BASE_ADDR + 6*4)
#define REG7_ADDR (BASE_ADDR + 7*4)
#define REG8_ADDR (BASE_ADDR + 8*4)
#define REG9_ADDR (BASE_ADDR + 9*4)
#define REG10_ADDR (BASE_ADDR + 10*4)
#define REG140_ADDR (BASE_ADDR + 140*4)
#define REG144_ADDR (BASE_ADDR + 144*4)  // SL
#define REG145_ADDR (BASE_ADDR + 145*4)  // SL
#define REG146_ADDR (BASE_ADDR + 146*4)  // WL
#define REG147_ADDR (BASE_ADDR + 147*4)  // WL
#define REG148_ADDR (BASE_ADDR + 148*4)  // BL
#define REG149_ADDR (BASE_ADDR + 149*4)  // BL
#define REG150_ADDR (BASE_ADDR + 150*4)  // BL
#define REG151_ADDR (BASE_ADDR + 151*4)  // BL
#define REG152_ADDR (BASE_ADDR + 152*4)  // BL
#define REG160_ADDR (BASE_ADDR + 160*4)

#define READ_FINISH_Pos 0
#define READ_FINISH_Msk (1 << READ_FINISH_Pos)
#define SET_FORM_FINISH_Pos 1
#define SET_FORM_FINISH_Msk (1 << SET_FORM_FINISH_Pos)
#define RESET_FINISH_Pos 2
#define RESET_FINISH_Msk (1 << RESET_FINISH_Pos)
#define MAP_SRF_FINISH_Pos 5
#define MAP_SRF_FINISH_Msk (1 << RESET_FINISH_Pos)
#define MAP_READ_FINISH_Pos 6
#define MAP_READ_FINISH_Msk (1 << RESET_FINISH_Pos)
#define COMMON_FINISH_Msk 0x7F

#define MAP_SET_FORM 0x01
#define MAP_READ 0x02
#define MAP_RESET 0x03
#define FORM_MODE 0x0A
#define READ_MODE 0x0B
#define SET_MODE 0x0C
#define RESET_MODE 0x0D

#define BL_COUNT 128
#define SL_COUNT 32
#define WL_COUNT 32
#define TIA_COUNT 64

#define CELL_COUNT 4096

#define PROGRESS_FINISH_FLAG 0xFFFF

#define POSITIVE_READ 0
#define NEGATIVE_READ 1

#define FIRST_INC_BSLV 0
#define FIRST_INC_WLV 1

#define OP_RESULT_SIZE_INT 40960000

#define GND_SWITCH 0
#define DAC_SWITCH 1
#define FLOAT_SWITCH 2
#define TIA_SWITCH 3

typedef enum
{
    LESS_THAN,
    WITHIN_SCOPE,
    GREATER_THAN
} CompareResult_t;

typedef struct 
{
    // uint32_t ChipNum;
    // uint32_t mode;
    uint32_t BLActive;
    uint32_t SLActive;
    uint32_t WLActive;
    uint32_t TIAFeedback;
    uint32_t BLVActive;
    uint32_t SLVActive;
    uint32_t WLVActive;
    uint32_t PulseWidth;
    uint32_t PulseGap;
    uint32_t PulseCount;
    uint32_t ReadDirection;
} Map_OneCellCfg_t;

typedef struct
{
    uint32_t FormVWLStart;
    uint32_t FormVWLStep;
    uint32_t FormVWLEnd;
    uint32_t FormVBLStart;
    uint32_t FormVBLStep;
    uint32_t FormVBLEnd;
    uint32_t SetVWLStart;
    uint32_t SetVWLStep;
    uint32_t SetVWLEnd;
    uint32_t SetVBLStart;
    uint32_t SetVBLStep;
    uint32_t SetVBLEnd;
    uint32_t RstVWLStart;
    uint32_t RstVWLStep;
    uint32_t RstVWLEnd;
    uint32_t RstVSLStart;
    uint32_t RstVSLStep;
    uint32_t RstVSLEnd;
    // uint32_t *TargetBuf;
    uint32_t ErrorLimit;
    uint32_t Nmax;
    uint32_t ReadDirection;
} Map_FinderCfg_t;

typedef struct
{
    uint32_t BLStart;
    uint32_t BLCnt;
    uint32_t SLStart;
    uint32_t SLCnt;
    // uint32_t WLStart;
    // uint32_t WLCnt;
} AddrArea_t;

typedef struct
{
    uint32_t TIAFeedback;
    uint32_t BLStart;
    uint32_t BLCnt;
    uint32_t SLStart;
    uint32_t SLCnt;
    uint32_t PulseWidth;
    uint32_t PulseMax;
    uint32_t ReadV;
    uint32_t FormVWLStart;
    uint32_t FormVWLStep;
    uint32_t FormVWLEnd;
    uint32_t FormVBLStart;
    uint32_t FormVBLStep;
    uint32_t FormVBLEnd;
    uint32_t SetVWLStart;
    uint32_t SetVWLStep;
    uint32_t SetVWLEnd;
    uint32_t SetVBLStart;
    uint32_t SetVBLStep;
    uint32_t SetVBLEnd;
    uint32_t RstVWLStart;
    uint32_t RstVWLStep;
    uint32_t RstVWLEnd;
    uint32_t RstVSLStart;
    uint32_t RstVSLStep;
    uint32_t RstVSLEnd;
    uint32_t Errorbar;
    uint32_t ITarget;
    uint32_t BLPar;
    uint32_t SLPar;
} MapCfg_t;


typedef struct
{
    uint32_t SetVWLStart;
    uint32_t SetVWLStep;
    uint32_t SetVWLEnd;
    uint32_t SetVBLStart;
    uint32_t SetVBLStep;
    uint32_t SetVBLEnd;
    uint32_t Nmax;
    uint32_t ReadDirection;
    uint32_t VoltageIncMode; // FIRST_INC_BSLV, FIRST_INC_WLV
} SetFinderCfg_t;

typedef struct
{
    uint32_t RstVWLStart;
    uint32_t RstVWLStep;
    uint32_t RstVWLEnd;
    uint32_t RstVSLStart;
    uint32_t RstVSLStep;
    uint32_t RstVSLEnd;
    uint32_t Nmax;
    uint32_t ReadDirection;
    uint32_t VoltageIncMode; // FIRST_INC_BSLV, FIRST_INC_WLV
} RstFinderCfg_t;

typedef struct 
{
    // uint32_t mode;
    uint32_t *BLInput;
    uint32_t *SLInput;
    uint32_t *WLInput;
    uint32_t SLActive;
    uint32_t TIAFeedback;
    uint32_t BLVActive;
    uint32_t SLVActive;
    uint32_t WLVActive;
    uint32_t PulseWidth;
    uint32_t PulseGap;
    uint32_t PulseCount;
    uint32_t ReadDirection;
} Parallel_CellCfg_t;

static INLINE void RERAM_Reset(void)
{
    Xil_Out32(REG1_ADDR, 0);
    Xil_Out32(REG2_ADDR, 1);
}

static INLINE void RERAM_Start(void)
{
    Xil_Out32(REG2_ADDR, 0);
    Xil_Out32(REG1_ADDR, 1);
}

int App_RegCfg(uint8_t RegTable[REG_TABLE_SIZE_BYTE], uint8_t readBuf[READ_DATA_SIZE_BYTE]);
int Map_OperateFlow(Map_FinderCfg_t *FinderCfg, AddrArea_t *AddrArea);
int App_SeqRead(uint32_t BLActive, uint32_t SLActive, uint32_t *ReadV, uint32_t *ReadResult, int len);
int SetTarget(SetFinderCfg_t *FinderCfg, AddrArea_t *AddrArea);
int ResetTarget(RstFinderCfg_t *FinderCfg, AddrArea_t *AddrArea);
int ApplyOp(uint32_t *opConfig);

#endif
