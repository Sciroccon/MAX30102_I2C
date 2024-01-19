#include <stdint.h>
#include "max.h"
#include "i2c.h"
#include "usart.h"
#include "delay.h"

uint32_t raw_Samples[BUFFER_SIZE];
float    dc_Rem_Samples[BUFFER_SIZE];
float    maf[BUFFER_SIZE];
float    butter[BUFFER_SIZE];

int main(void) {
    initUSART2(USART2_BAUDRATE_921600);
    I2C_Conf();
    MAX_Init();
    delay_ms(1500);
    
   int bpmReadings[4] = {0}; // Array to store BPM readings
   int bpmcnt=0;


   while(1)
   {
      MAX_GetFifoSample(raw_Samples,BUFFER_SIZE);
      dcRemoval(raw_Samples,dc_Rem_Samples,BUFFER_SIZE);
      movingAverageFilter(dc_Rem_Samples,maf,BUFFER_SIZE);
      bandpassFilter(maf,butter,0.67,8.0);

      int i=0;
      int bpm=0;

      if(raw_Samples[10]<100000)
      {
      printUSART2("Postavite prst na senzor!\n");
      bpmcnt=0;
      }
      else
      {
      bpm=calculateBPM(butter,BUFFER_SIZE,100.0);
      int j=0;
      for (j = 0; j < 3; j++) 
      {
         bpmReadings[j] = bpmReadings[j + 1];
      }
      bpmReadings[3] = bpm;
      bpmcnt++;
      if(bpmcnt>=4)
      {
      int averageBPM = (bpmReadings[0] + bpmReadings[1] + bpmReadings[2] + bpmReadings[3]) / 4;
       printUSART2("AVG BPM:%d\n",averageBPM);
       printUSART2("BPM:%d\n",bpm);
      }
      else{printUSART2("Ucitavanje podataka...\n");}
   
 printUSART2("--------------------------\n");

      }
      
      
      
   }
   return 0;

}


