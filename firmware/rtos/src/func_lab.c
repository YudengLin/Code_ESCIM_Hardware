#include "func_lab.h"
#include <stdio.h>

//length:uint32_t数据长度
void SwapUint32(uint32_t *buf, int length)
{
    //所有的数据反转
    for (int i = 0; i < length; i++)
    {
        buf[i] = SWAP_UINT32(buf[i]);
    }
}

/****
    * @brief  Reports the name of the source file and the source line number
    *         where the assert_param error has occurred.
    * @param  file: pointer to the source file name
    * @param  line: assert_param error line source number
    * @retval None
    */
void assert_failed(uint8_t* file, uint32_t line)
{
    /* User can add his own implementation to report the file name and line number,
        ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

    printf("Wrong parameters value: file %s on line %d\r\n", file, (int)line);
    /* Infinite loop */
    while (1)
    {
    }
}

void ErrorPrint(uint8_t* file, uint32_t line)
{
    printf("An error occurred: file %s on line %d\r\n", file, (int)line);
}