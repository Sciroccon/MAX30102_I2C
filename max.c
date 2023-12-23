#include "stm32f4xx.h"
#include "max.h"
#include "i2c.h"
#include "usart.h"
#include "delay.h"

//wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
	// MAX : PB6 -> SCL & PB7 -> SDA
	//------------------------------------------------------------------ 

void MAX_Init(void) {
    delay_ms(5);
    I2C_Start();
    I2C_Send_Addr(MAX30102_W_ADDRESS);
    I2C_Send8bit(MODE_REG);
    I2C_Send8bit(HRM_MODE);
    I2C_Stop();
    
    delay_ms(5);
    I2C_Start();
    I2C_Send_Addr(MAX30102_W_ADDRESS);
    I2C_Send8bit(LED1_PULSE_AMPLITUDE_REG);
    I2C_Send8bit(LED1_ON);
    I2C_Stop();

    delay_ms(5);
    I2C_Start();
    I2C_Send_Addr(MAX30102_W_ADDRESS);
    I2C_Send8bit(FIFO_WRITE_POINTER);
    I2C_Send8bit(0x00);
    I2C_Stop();

    delay_ms(5);

    I2C_Start();
    I2C_Send_Addr(MAX30102_W_ADDRESS);
    I2C_Send8bit(FIFO_READ_POINTER);
    I2C_Send8bit(0x00);
    I2C_Stop();

    delay_ms(5);

    I2C_Start();
    I2C_Send_Addr(MAX30102_W_ADDRESS);
    I2C_Send8bit(OVERFLOW_COUNTER);
    I2C_Send8bit(0x00);
    I2C_Stop();

    delay_ms(5);

    I2C_Start();
    I2C_Send_Addr(MAX30102_W_ADDRESS);
    I2C_Send8bit(FIFO_CONF_REGISTER);
    I2C_Send8bit(SMP_AVG_4 | FIFO_ROLLOVER_EN);      
    I2C_Stop();
    
    delay_ms(5);

}

uint8_t MAX_ReadRegister(uint8_t regAddr){
    I2C_Start();
    I2C_Send_Addr(MAX30102_W_ADDRESS);
    I2C_Send8bit(regAddr);
    I2C_Start();
    I2C_Send_Addr(MAX30102_R_ADDRESS);
    uint8_t data=I2C_Receive8bit(0);
    I2C_Stop();
    return data;

} 
uint32_t MAX_ReadFifoReg(void){
    I2C_Start();
    I2C_Send_Addr(MAX30102_W_ADDRESS);
    I2C_Send8bit(FIFO_DATA_REGISTER);
    I2C_Start();
    I2C_Send_Addr(MAX30102_R_ADDRESS);
    uint8_t byte1;
    uint8_t byte2;
    uint8_t byte3;
    uint32_t data=0x00000000;
    byte1=I2C_Receive8bit(1); 
    byte2=I2C_Receive8bit(1);
    byte3=I2C_Receive8bit(0); // last byte NACK
    byte1=byte1 & 0x03;       // In the first byte only the 2 least significant bits in the byte are used, 
                              // but they are the MSB in the raw sensor data,since the data is left justified
    data=(byte1<<16) | (byte2<<8) | byte3;
    return data;
}     
void MAX_GetFifoSample(uint32_t *data,uint8_t bufferSize){
        uint8_t rd_ptr = MAX_ReadRegister(FIFO_READ_POINTER);
        uint8_t wr_ptr = MAX_ReadRegister(FIFO_WRITE_POINTER);
        volatile int i=0;
        while(i<bufferSize)
        {
            rd_ptr = MAX_ReadRegister(FIFO_READ_POINTER);
            wr_ptr = MAX_ReadRegister(FIFO_WRITE_POINTER);
            if(wr_ptr!=rd_ptr)
            {

                data[i]=MAX_ReadFifoReg();
                i++;
            }


        }
}   
