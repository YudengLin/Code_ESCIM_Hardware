###### **Overview**
The code files in this directory are for the lower computer of the ESCIM hardware testing system, which needs to run on the ESCIM hardware platform. The ESCIM hardware system is designed for testing the 4K ReRAM array (128Row x 32Column). This system comprises three components: the upper computer program and SDK on the PC side, the ZC706 FPGA development board, and the 4K chip test board. The lower computer operates on the ZC706 FPGA development board.

The control program on the PC side is used to control the testing system and to process the result data; the FPGA acts as a bridge within the system. On one hand, it receives commands from the control program, controls the test board, and performs operations on the chip under test. On the other hand, it reads the results returned by the test board according to the timing requirements and sends them back to the control program; the chip test board carries the chip under test and provides the necessary power supply, signal generation circuits, and chip output signal processing circuits for the tested chip.