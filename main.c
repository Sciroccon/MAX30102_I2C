#include <stdint.h>
#include "max.h"
#include "i2c.h"
#include "usart.h"


int main(void) {
    uint32_t samples[BUFFER_SIZE];
    float dcRemSamples[BUFFER_SIZE];
    float filteredMean[BUFFER_SIZE];
    float finalFilteredData[BUFFER_SIZE];

    initUSART2(USART2_BAUDRATE_921600);
    I2C_Conf();
    MAX_Init();                             // Inicijalizacija MAX30102 senzora
while(1){
    MAX_GetFifoSample(samples,BUFFER_SIZE);
    applyDCRemovalFilter(samples,dcRemSamples,BUFFER_SIZE);
    meanFilter(dcRemSamples,filteredMean);
    medianFilter(filteredMean,finalFilteredData);
   volatile int i;
   for ( i = 0; i < BUFFER_SIZE; i++)
   {
    printUSART2(" %f\n",finalFilteredData[i]);
   }
}
    return 0;
}

