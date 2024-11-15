#ifndef FUNC_LAB_H_
#define FUNC_LAB_H_

#include <stdio.h>
#include <stdint.h>
#include "sleep.h"

//#define DEBUG

#ifdef DEBUG
#define debug printf
#else
#define debug dumb
#endif


#define USE_FULL_ASSERT

#if defined (__GNUC__) || defined (__ICCARM__) || defined (__MICROBLAZE__)
#define INLINE inline
#else
#define INLINE __inline
#endif

#ifdef USE_FULL_ASSERT

/****
    * @brief  The assert_param macro is used for function's parameters check.
    * @param  expr: If expr is false, it calls assert_failed function which reports
    *         the name of the source file and the source line number of the call
    *         that failed. If expr is true, it returns no value.
    * @retval None
    */
    #define assert_param(expr) ((expr) ? (void)0 : assert_failed((uint8_t *)__FILE__, __LINE__))
/* Exported functions ------------------------------------------------------- */
    void assert_failed(uint8_t* file, uint32_t line);
#else
    #define assert_param(expr) ((void)0)
#endif /* USE_FULL_ASSERT */


// 小端模式：从buf中得到uint16_t数据
#define GET_UINT16_LE(n,b,i)                            \
{                                                       \
    (n) = ( (uint16_t) (b)[(i)    ]       )             \
        | ( (uint16_t) (b)[(i) + 1] <<  8 );            \
}

// 小端模式：uint16_t数据放入地址buf中
#define PUT_UINT16_LE(n,b,i)                            \
{                                                       \
    (b)[(i)    ] = (uint8_t) ( (n)       );             \
    (b)[(i) + 1] = (uint8_t) ( (n) >>  8 );             \
}

// 大小端转换
#define SWAP_UINT32(x) ((((x) & 0xff000000) >> 24) | (((x) & 0x00ff0000) >>  8) | (((x) & 0x0000ff00) <<  8) | (((x) & 0x000000ff) << 24))

#define POLL_TIMEOUT(IO_func, ADDR, VALUE, COND, TIMEOUT_US) \
 ( {      \
    u64 timeout = TIMEOUT_US;    \
    for(;;) { \
        VALUE = IO_func(ADDR); \
        if(COND) \
            break; \
        else {    \
            usleep(1);  \
            timeout--; \
            if(timeout==0) \
            break;  \
        }  \
    }    \
    (timeout>0) ? 0 : -1;  \
 }  )

#define ERROR_PRINT() ErrorPrint((uint8_t *)__FILE__, __LINE__)

static INLINE void SetBit(uint32_t Addr, uint32_t shift)
{
    volatile uint32_t *LocalAddr = (volatile uint32_t *)Addr;
    *LocalAddr |= ((uint32_t)1 << (shift));
}

static INLINE void ClearBit(uint32_t Addr, uint32_t shift)
{
    volatile uint32_t *LocalAddr = (volatile uint32_t *)Addr;
    *LocalAddr &= ~((uint32_t)1 << (shift));
}

// 把寄存器从location开始的bits位设置为value值和得到寄存器从location开始的bits位值
static INLINE void SetBitsValue(uint32_t Addr, uint32_t bits, uint32_t location, uint32_t value)
{
    volatile uint32_t *LocalAddr = (volatile uint32_t *)Addr;
    (*LocalAddr) = (((*LocalAddr) & (~((((uint32_t)1 << (bits)) - 1) << (location)))) | ((uint32_t)(value) << (location)));
}

static INLINE uint32_t GetBitsValue(uint32_t Addr, uint32_t bits, uint32_t location)
{
    volatile uint32_t *LocalAddr = (volatile uint32_t *)Addr;
    return (((*LocalAddr) & ((((uint32_t)1 << (bits)) - 1) << (location))) >> (location));
}

static inline void dumb(const char *ctrl1, ...) {

}

void SwapUint32(uint32_t *buf, int length);
void ErrorPrint(uint8_t* file, uint32_t line);

#endif
