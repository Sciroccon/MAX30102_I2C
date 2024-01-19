#include "stm32f4xx.h"
#include "usart.h"
#include "max.h"


uint8_t clc;

void I2C_Conf(void){
RCC->APB1ENR |= RCC_APB1ENR_I2C1EN;  // Uključuje I2C1 periferiju
RCC->AHB1ENR |= RCC_AHB1ENR_GPIOBEN; // Uključuje GPIOB periferiju (port na kojem je I2C1 povezan)

// I2C software reset
I2C1->CR1 |= I2C_CR1_SWRST;
I2C1->CR1 &= ~(I2C_CR1_SWRST);


GPIOB->MODER |= GPIO_MODER_MODER6_1 | GPIO_MODER_MODER7_1; // Alternativna funkcija
GPIOB->OTYPER |= GPIO_OTYPER_OT_6 | GPIO_OTYPER_OT_7;     // Otvoreni kolektor/otvoreni izlaz
GPIOB->OSPEEDR |= ( (2UL<<(6*2)) | (2UL<<(7*2)) );
 GPIOB->OSPEEDR |= GPIO_OSPEEDER_OSPEEDR6 | GPIO_OSPEEDER_OSPEEDR7; // Visoka brzina
GPIOB->PUPDR |= GPIO_PUPDR_PUPDR6_0 | GPIO_PUPDR_PUPDR7_0; // Pull-up
GPIOB->AFR[0] |= (4 << (6 * 4)) | (4 << (7 * 4)); // AF4 za I2C1 na pinovima PB6 i PB7

// Konfiguracija registara za I2C
I2C1->OAR1 |= 0x4000;
I2C1->CR1 &= ~I2C_CR1_PE; 	// Isključuje I2C prije nego što se konfigurise
I2C1->CR2 = 0x002A; 		// 42MHz takt, moze ici do max 42Mhz
I2C1->CCR = 0x35 | I2C_CCR_FS;			// T=1/F=1/400khz=0.0025ms  Duty cycle Ton=0.01ms/2=5000ns jer hocemo da je duty cycle 0.5
							// Periferal clock radi na 16MHz, te ide da je perio Tpclk=1/16Mhz=62.5ns, te ide CCR=5000ns/62.5=80 ili moze ici CCR=16Mhz/2*100khz
I2C1->TRISE = 0x2B; 		// Računamo prema formuli za 100 kHz brzinu (Periferal_clock(42Mhz)/1Mhz) + 1)= 42+1= 43


I2C1->CR1 |= I2C_CR1_PE; 	// Ponovno uključi I2C
}


void I2C_Start(){
    I2C1->CR1 |= I2C_CR1_ACK;
	I2C1->CR1 |= I2C_CR1_START;
	while(!(I2C1->SR1 & I2C_SR1_SB)){} 		// Počni START sekvencu

}

void I2C_Send8bit(uint8_t data){
	while(!(I2C1->SR1 & I2C_SR1_TXE)){   } 		// Provjerava da li je data registar prazan
	I2C1->DR = data;
	while(!(I2C1->SR1 & I2C_SR1_BTF)){}		// Provjerava da li je bajt prenesen

}

void I2C_Send_Addr(volatile uint8_t Addr){
    I2C1->DR = Addr;  						// Adresa koja se salje
    while(!(I2C1->SR1 & I2C_SR1_ADDR)){}	// Provjerava da li je poslata adresa
    clc = (I2C1->SR1 | I2C1->SR2);			// Da bi se ocistio ADDR bit, moraju se procitati SR1 I SR2 registri uzastopno
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

