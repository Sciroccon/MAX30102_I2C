## MAX30102 Pulse and Oximeter sensor for use with a STM32F407 MCU
This project is finished.

Connection is realized via I2C via I2C1 peripheral on APB1(42Mhz) Bus.PB6(SCL) and PB7(SDA) are used for connection via the MAX sensor and the STM32 MCU.
This project was made to detect heart pulses and measure BPM(Beats per minute).The detection algorithm is kinda iffy,and will throw false positives if the pressure on the sensor is too high,or the person is moving too much.Person must be still and not applying too much pressure to the sensor.
Hope this will help to whoever is planning to use this sensor with the STM32 MCU.
