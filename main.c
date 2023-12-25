#include <stdint.h>
#include "max.h"
#include "i2c.h"
#include "usart.h"
#include "delay.h"


int main(void) {
   // initSTOPWATCH();
    uint32_t samples[BUFFER_SIZE];
    float dcRemSamples[BUFFER_SIZE];
    float filteredMean[BUFFER_SIZE];
    float finalFilteredData[BUFFER_SIZE];

    initUSART2(USART2_BAUDRATE_921600);
    I2C_Conf();
    MAX_Init();                             // Inicijalizacija MAX30102 senzora
while(1){
    //startSTOPWATCH();
    MAX_GetFifoSample(samples,BUFFER_SIZE);
    applyDCRemovalFilter(samples,dcRemSamples,BUFFER_SIZE);
    meanFilter(dcRemSamples,filteredMean);
    medianFilter(filteredMean,finalFilteredData);
    calculateHeartRate(finalFilteredData,BUFFER_SIZE);
    // int i=0;
    // while(i<BUFFER_SIZE){
    // printUSART2("%f\n",finalFilteredData[i]);
    // i++;
    // }
    }
    return 0;

}


