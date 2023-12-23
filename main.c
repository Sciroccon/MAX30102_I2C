#include <stdint.h>
#include "max.h"
#include "i2c.h"
#include "usart.h"

#define BUFFER_SIZE 32

int main(void) {
    uint16_t samples[BUFFER_SIZE];
    initUSART2(USART2_BAUDRATE_921600);
    I2C_Conf();
    MAX_Init(); // Inicijalizacija MAX30102 senzora
    while(1){
    MAX_GetFifoSample(samples,3,BUFFER_SIZE);
    volatile int i;
    for(i=0;i<BUFFER_SIZE;++i)
    {
        printUSART2("DATA:%d\n",samples[i]);
    }
    }
    return 0;
}

