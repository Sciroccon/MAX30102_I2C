#ifndef __MAX_H_
#define __MAX_H_

#define MAX30102_W_ADDRESS 0xAE // Adresa MAX30102 (WRITE)
#define MAX30102_R_ADDRESS 0xAF // Adresa MAX30102 (READ)


#define INTERRUPT_STATUS_1 0x00
#define INTERRUPT_STATUS_2 0x01
#define INTERRUPT_ENABLE_1 0x02
#define INTERRUPT_ENABLE_2 0x03
#define FIFO_WRITE_POINTER 0x04
#define OVERFLOW_COUNTER 0x05
#define FIFO_READ_POINTER 0x06
#define FIFO_DATA_REGISTER 0x07
#define FIFO_CONF_REGISTER 0x08
#define MODE_REG 0x09                   // Mode selection reg


#define FIFO_ROLLOVER_EN 0x10
#define SMP_AVG_4 0x40                  //Number of samples averaged to reduce data throughput 
#define HRM_MODE 0x02
#define OXI_MODE 0x03
#define LED1_PULSE_AMPLITUDE_REG 0x0C   //RED LED
#define LED2_PULSE_AMPLITUDE_REG 0x0D   //IR LED
#define LED1_ON 0X1F                    //LED Current value typical =0x1f, 0X00-0XFF


void MAX_Init(void);
void MAX_GetFifoSample(uint16_t *data, uint16_t numBytes,uint8_t bufferSize);

#endif