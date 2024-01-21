#include "stm32f4xx.h"
#include "usart.h"
#include "max.h"


uint8_t clc;

void I2C_Conf(void){
RCC->APB1ENR |= RCC_APB1ENR_I2C1EN;  
RCC->AHB1ENR |= RCC_AHB1ENR_GPIOBEN; 

// I2C software reset
I2C1->CR1 |= I2C_CR1_SWRST;
I2C1->CR1 &= ~(I2C_CR1_SWRST);


GPIOB->MODER |= GPIO_MODER_MODER6_1 | GPIO_MODER_MODER7_1; 
GPIOB->OTYPER |= GPIO_OTYPER_OT_6 | GPIO_OTYPER_OT_7;               // Open drain
GPIOB->OSPEEDR |= GPIO_OSPEEDER_OSPEEDR6 | GPIO_OSPEEDER_OSPEEDR7;  // High speed
GPIOB->PUPDR |= GPIO_PUPDR_PUPDR6_0 | GPIO_PUPDR_PUPDR7_0;          // Pull-up
GPIOB->AFR[0] |= 0x44000000;                                        // AF4 for I2C1 on pins PB6 i PB7

// I2C Register configuration
I2C1->OAR1 |= 0x4000;               // Bit 14 needs to be set high by software
I2C1->CR1 &= ~I2C_CR1_PE; 	        // Turns off I2C peripheral,as it needs to be turned off before configuration
I2C1->CR2 = 0x002A; 		        // 42MHz Clock
I2C1->CCR = 0x35 | I2C_CCR_FS;		// T=1/F=1/400khz=0.0025ms, Ton=0.0025ms/2=1250ns because we want the duty cycle to be 0.5
							        // Peripheral clock is set at 42MHz, so Tpclk=1/42Mhz=24ns, so that means CCR=1250ns/24ns=52.08=53ns or it can be calculated also as CCR=42Mhz/2*400kHz
I2C1->TRISE = 0x7; 		            // MAX30102 requires that the maximum rise time be no bigger than 300ns,so 300ns/53ns=6ns and 1 needs to be added to ensure TRISE value is at least 1.


I2C1->CR1 |= I2C_CR1_PE;
}


void I2C_Start(){
    I2C1->CR1 |= I2C_CR1_ACK;
	I2C1->CR1 |= I2C_CR1_START;
	while(!(I2C1->SR1 & I2C_SR1_SB)){} 		// Wait til START bit is genetrated

}

void I2C_Send8bit(uint8_t data){
	while(!(I2C1->SR1 & I2C_SR1_TXE)){   }  // Checks if DR is empty
	I2C1->DR = data;
	while(!(I2C1->SR1 & I2C_SR1_BTF)){}		// Checks if byte has been sent

}

void I2C_Send_Addr(volatile uint8_t Addr){
    I2C1->DR = Addr;  						
    while(!(I2C1->SR1 & I2C_SR1_ADDR)){}	// Checks if address has been sent
    clc = (I2C1->SR1 | I2C1->SR2);			// To clear the ADDR bit,registers SR1 and SR2 must be read one after another
}

uint8_t I2C_Receive8bit(uint8_t ack){
    if (ack)
    {
        I2C1->CR1 |= I2C_CR1_ACK;
    }
    else
    {
        
        I2C1->CR1 &= ~I2C_CR1_ACK;
    }
    while (!(I2C1->SR1 & I2C_SR1_RXNE)){}
    uint8_t data = I2C1->DR;
    return data;
}


void I2C_Stop(){
    I2C1->CR1 |= I2C_CR1_STOP;		
	while(I2C1->CR1 & I2C_CR1_STOP);
}

