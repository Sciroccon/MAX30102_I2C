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
uint16_t MAX_ReadFifoReg(uint8_t regAddr,uint8_t size){
    I2C_Start();
    I2C_Send_Addr(MAX30102_W_ADDRESS);
    I2C_Send8bit(regAddr);
    I2C_Start();
    I2C_Send_Addr(MAX30102_R_ADDRESS);
    uint8_t dummy;
    uint8_t hByte;
    uint8_t lByte;
    uint16_t data;
    dummy=I2C_Receive8bit(1);
    hByte=I2C_Receive8bit(1);
    lByte=I2C_Receive8bit(0); //last byte NACK
    data=(hByte<<8) | lByte;
    return data;

}     
void MAX_GetFifoSample(uint16_t *data, uint16_t numBytes,uint8_t bufferSize){
        uint8_t rd_ptr = MAX_ReadRegister(FIFO_READ_POINTER);
        uint8_t wr_ptr = MAX_ReadRegister(FIFO_WRITE_POINTER);
        volatile int i=0;;
        while(i<bufferSize)
        {
            rd_ptr = MAX_ReadRegister(FIFO_READ_POINTER);
            wr_ptr = MAX_ReadRegister(FIFO_WRITE_POINTER);
            if(wr_ptr!=rd_ptr)
            {
                data[i]=MAX_ReadFifoReg(FIFO_DATA_REGISTER,numBytes);
                i++;
            }


        }
}   
