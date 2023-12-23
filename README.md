## MAX30102 Pulse and Oximeter sensor for use with a STM32F407 MCU
Disclaimer!
This project is still not finished 

Connection is realized via I2C via I2C1 peripheral on APB1(42Mhz) Bus.PB6(SCL) and PB7(SDA) are used for connection via the MAX sensor and the STM32 MCU.
Up until this point i have managed to get the data readings off the sensor,all that is left now to do is to write the logic for calculating the BPM.
