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

void applyDCRemovalFilter(uint32_t* input,float* output, uint8_t bufferSize) {
    // Initial condition: w(-1) = 0
    float w_prev = 0.0f;
    volatile int i;
    for (i = 0; i < bufferSize; ++i) {
        // Apply DC removal filter
        float x_t = (float)input[i];
        float w_t = x_t + ALPHA * w_prev;

        // Calculate y(t) as the difference between consecutive filtered values
        float y_t = w_t - w_prev;
        // Update previous filtered value for the next iteration
        w_prev = w_t;

        // Replace the original sample with the filtered value
        output[i] = y_t;
    }
}   


void meanFilter(float* input, float* output) {
volatile int i;
    for (i = 0; i < BUFFER_SIZE; ++i) {
        float sum = 0;

        // Compute the mean within the window
        volatile int j;
        for (j = i - MEAN_FILTER_SIZE / 2; j <= i + MEAN_FILTER_SIZE / 2; ++j) {
            if (j >= 0 && j < BUFFER_SIZE) {
                sum += input[j];
            }
        }

        // Assign the mean value to the output
        output[i] = sum / MEAN_FILTER_SIZE;
    }
}

// Function to apply the median filter
void medianFilter(float* input, float* output) {
    volatile int i;
    for (i = 0; i < BUFFER_SIZE; ++i) {
        float window[MEAN_FILTER_SIZE];
        uint16_t count = 0;

        // Populate the window array
        volatile int j;
        for ( j = i - MEAN_FILTER_SIZE / 2; j <= i + MEAN_FILTER_SIZE / 2; ++j) {
            if (j >= 0 && j < BUFFER_SIZE) {
                window[count++] = input[j];
            }
        }
        volatile int g;
        // Sort the window array (e.g., using bubble sort for simplicity)
        for ( g = 0; g < count - 1; ++g) {
                volatile int k;
            for (k = 0; k < count - g - 1; ++k) {
                if (window[k] > window[k + 1]) {
                    // Swap values
                    float temp = window[k];
                    window[k] = window[k + 1];
                    window[k + 1] = temp;
                }
            }
        }

        // Assign the median value to the output
        output[i] = window[count / 2];
    }
}
