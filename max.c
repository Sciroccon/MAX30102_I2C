#include "stm32f4xx.h"
#include "max.h"
#include "i2c.h"
#include "usart.h"
#include "delay.h"
#include <math.h>
#include <stdio.h>

#define M_PI 3.14159265358979323846


//wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
	// MAX : PB6 -> SCL & PB7 -> SDA
	//------------------------------------------------------------------ 

void MAX_Init(void) {
    delay_ms(4);
    I2C_Start();
    I2C_Send_Addr(MAX30102_W_ADDRESS);
    I2C_Send8bit(MODE_REG);
    I2C_Send8bit(HRM_MODE);
    I2C_Stop();
    delay_ms(4);

    I2C_Start();
    I2C_Send_Addr(MAX30102_W_ADDRESS);
    I2C_Send8bit(LED1_PULSE_AMPLITUDE_REG);
    I2C_Send8bit(LED1_ON);
    I2C_Stop();
   
delay_ms(4);

    I2C_Start();
    I2C_Send_Addr(MAX30102_W_ADDRESS);
    I2C_Send8bit(SPO2_CONF);
    I2C_Send8bit(0X06);
    I2C_Stop();
    delay_ms(4);


    

    I2C_Start();
    I2C_Send_Addr(MAX30102_W_ADDRESS);
    I2C_Send8bit(FIFO_WRITE_POINTER);
    I2C_Send8bit(0x00);
    I2C_Stop();
    delay_ms(4);

    I2C_Start();
    I2C_Send_Addr(MAX30102_W_ADDRESS);
    I2C_Send8bit(FIFO_READ_POINTER);
    I2C_Send8bit(0x00);
    I2C_Stop();
    delay_ms(4);

    I2C_Start();
    I2C_Send_Addr(MAX30102_W_ADDRESS);
    I2C_Send8bit(OVERFLOW_COUNTER);
    I2C_Send8bit(0x00);
    I2C_Stop();
    delay_ms(4);

I2C_Start();
    I2C_Send_Addr(MAX30102_W_ADDRESS);
    I2C_Send8bit(FIFO_CONF_REGISTER);
    I2C_Send8bit( FIFO_ROLLOVER_EN);      
    I2C_Stop();
    delay_ms(4);

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
uint32_t MAX_ReadFifoReg(void)
{
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



void MAX_GetFifoSample(uint32_t *data, uint8_t bufferSize) {
    uint8_t rd_ptr = MAX_ReadRegister(FIFO_READ_POINTER);
    uint8_t wr_ptr = MAX_ReadRegister(FIFO_WRITE_POINTER);

        int i = 0;
        while (i < bufferSize) {
            int samplesToRead = wr_ptr - rd_ptr;

            samplesToRead = (samplesToRead < 0) ? (samplesToRead + FIFO_DEPTH) : samplesToRead; 
            uint8_t samplesRead = (samplesToRead < bufferSize - i) ? samplesToRead : (bufferSize - i);
            int j;
            for (j = 0; j < samplesRead; ++j) {
                data[i++] = MAX_ReadFifoReg();
            }

            rd_ptr = MAX_ReadRegister(FIFO_READ_POINTER);
            wr_ptr = MAX_ReadRegister(FIFO_WRITE_POINTER);
            
        }
}




void dcRemoval(uint32_t* input,float* output,uint8_t bufferSize) {
    // Calculate the mean of the input signal
    float mean = 0.0;
    int i=0;
    for (i = 0; i < bufferSize; ++i) {
        mean += input[i];
    }
    mean /= bufferSize;
    // Subtract the mean from each data point and store in the output array
    for (i = 0; i < bufferSize; ++i) {
        output[i] = (float)(input[i] - mean);
    }
}


void movingAverageFilter(float* input, float* output, uint8_t bufferSize) {
    int i = 0;
    float sum = 0.0;

    for (i = 0; i < WINDOW_SIZE / 2; ++i) {
        sum += input[i];
    }

    for (i = 0; i < bufferSize; ++i) {
        if (i + WINDOW_SIZE / 2 < bufferSize) {
            sum += input[i + WINDOW_SIZE / 2];
        }

        if (i - WINDOW_SIZE / 2 - 1 >= 0) {
            sum -= input[i - WINDOW_SIZE / 2 - 1];
        }

        output[i] = sum / WINDOW_SIZE;
    }
}

void bandpassFilter(float* input, float* output, float cutoff_low, float cutoff_high) {
    float alpha, a1, b0, b1;
    float x1 = 0.0, y1 = 0.0;  // State variables

    // Calculate filter coefficients using bilinear transformation
    alpha = tan(M_PI * (cutoff_high - cutoff_low) / 100.0);
    a1 = (alpha - 1) / (alpha + 1);
    b0 = alpha / (alpha + 1);
    b1 = b0;

    // Apply filter to each sample
    int i=0;
    for (i = 0; i < BUFFER_SIZE; i++) {
        output[i] = b0 * input[i] + b1 * x1 - a1 * y1;

        // Update state variables
        x1 = input[i];
        y1 = output[i];
    }
}

#define MAX_WINDOW_SIZE 5
// Function to implement a mean median filter with sorting
void meanMedianFilter(float* input, float* output, int size, int window_size) {
    // Ensure the window size does not exceed the maximum allowed size
    window_size = (window_size > MAX_WINDOW_SIZE) ? MAX_WINDOW_SIZE : window_size;

    // Apply the mean median filter to each sample
    int i,j,k;
    for (i = window_size; i < size; ++i) {
        // Declare the window array with a fixed size
        float window[MAX_WINDOW_SIZE + 1];

        // Copy values to the window array
        for (j = i - window_size, k = 0; j <= i; ++j, ++k) 
        {
            window[k] = input[j];
        }

        // Sort the window array (you can use any sorting algorithm)
        // Here, we use a simple bubble sort for illustration purposes
        for ( k = 0; k < window_size; ++k) {
            int l;
            for (l = 0; l < window_size - k - 1; ++l) {
                if (window[l] > window[l + 1]) {
                    // Swap elements
                    float temp = window[l];
                    window[l] = window[l + 1];
                    window[l + 1] = temp;
                }
            }
        }

        // Calculate the mean median difference
        float mean = 0.0;
        float median;

        // Calculate the mean
        for ( k = 0; k <= window_size; ++k) {
            mean += window[k];
        }
        mean /= (float)(window_size + 1);

        // Calculate the median
        if (window_size % 2 == 0) {
            // If window_size is even, take the average of the middle elements
            median = (window[window_size / 2] + window[window_size / 2 - 1]) / 2.0;
        } else {
            // If window_size is odd, take the middle element
            median = window[window_size / 2];
        }

        // Calculate the mean median difference
        output[i] = input[i] - median;
    }
}
float findMax(float* array, int size) {
    float max = array[0];
    int i=1;
    for (i = 1; i < size; ++i) {
        if (array[i] > max) {
            max = array[i];
        }
    }
    return max;
}

#define MIN_DIST 27
float calculateBPM(float* filtered_data, int size, float sampling_rate) {
    int peak_detected = 0;
    int peak_count = 0;
    float total_time = 0.0;
    int last_peak_index=0;
    int i=1;

    float sum = 0.0;
    for (i = 0; i < size; ++i) {
        sum += filtered_data[i];
    }
    float THRESHOLD= sum/size;

    for ( i = 1; i < size - 1; ++i) {
        if (filtered_data[i] > filtered_data[i - 1] && filtered_data[i] > filtered_data[i + 1] && filtered_data[i] > THRESHOLD) {
            if (peak_detected != 1) {
                if(last_peak_index != 0)
                {
                    if((i-last_peak_index)<=MIN_DIST){continue;}
                }
                peak_detected = 1;
                float inter_beat_interval = (i-last_peak_index)/ sampling_rate;
                total_time += inter_beat_interval;
                ++peak_count;
                last_peak_index = i;
            }
        } else {
            peak_detected = 0;
        }
    }

    if (peak_count < 2) {
        return 0.0;
    }

    float average_interval = total_time / (peak_count - 1);
    float bpm = 60.0 / average_interval;
    if(peak_count==2){bpm=bpm*2;}


    return bpm;
}
