	.syntax unified
	.cpu cortex-m4
	.eabi_attribute 27, 3
	.eabi_attribute 28, 1
	.fpu fpv4-sp-d16
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.thumb
	.file	"i2c.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	I2C_Conf
	.thumb
	.thumb_func
	.type	I2C_Conf, %function
I2C_Conf:
.LFB110:
	.file 1 "i2c.c"
	.loc 1 8 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 9 0
	ldr	r1, .L3
	.loc 1 13 0
	ldr	r3, .L3+4
	.loc 1 9 0
	ldr	r0, [r1, #64]
	.loc 1 17 0
	ldr	r2, .L3+8
	.loc 1 9 0
	orr	r0, r0, #2097152
	.loc 1 8 0
	push	{r4}
	.cfi_def_cfa_offset 4
	.cfi_offset 4, -4
	.loc 1 9 0
	str	r0, [r1, #64]
	.loc 1 10 0
	ldr	r0, [r1, #48]
	orr	r0, r0, #2
	str	r0, [r1, #48]
	.loc 1 13 0
	ldrh	r1, [r3]
	mvn	r1, r1, lsl #17
	mvn	r1, r1, lsr #17
	uxth	r1, r1
	strh	r1, [r3]	@ movhi
	.loc 1 14 0
	ldrh	r1, [r3]
	ubfx	r1, r1, #0, #15
	strh	r1, [r3]	@ movhi
	.loc 1 17 0
	ldr	r1, [r2]
	orr	r1, r1, #40960
	str	r1, [r2]
	.loc 1 18 0
	ldr	r1, [r2, #4]
	orr	r1, r1, #192
	str	r1, [r2, #4]
	.loc 1 19 0
	ldr	r1, [r2, #8]
	orr	r1, r1, #40960
	str	r1, [r2, #8]
	.loc 1 20 0
	ldr	r1, [r2, #8]
	orr	r1, r1, #61440
	str	r1, [r2, #8]
	.loc 1 21 0
	ldr	r1, [r2, #12]
	orr	r1, r1, #20480
	str	r1, [r2, #12]
	.loc 1 22 0
	ldr	r1, [r2, #32]
	orr	r1, r1, #1140850688
	str	r1, [r2, #32]
	.loc 1 25 0
	ldrh	r2, [r3, #8]
	uxth	r2, r2
	orr	r2, r2, #16384
	strh	r2, [r3, #8]	@ movhi
	.loc 1 26 0
	ldrh	r2, [r3]
	bic	r2, r2, #1
	lsls	r2, r2, #16
	lsrs	r2, r2, #16
	.loc 1 27 0
	movs	r4, #16
	.loc 1 28 0
	movs	r0, #80
	.loc 1 30 0
	movs	r1, #3
	.loc 1 26 0
	strh	r2, [r3]	@ movhi
	.loc 1 27 0
	strh	r4, [r3, #4]	@ movhi
	.loc 1 28 0
	strh	r0, [r3, #28]	@ movhi
	.loc 1 30 0
	strh	r1, [r3, #32]	@ movhi
	.loc 1 33 0
	ldrh	r2, [r3]
	.loc 1 34 0
	ldr	r4, [sp], #4
	.cfi_restore 4
	.cfi_def_cfa_offset 0
	.loc 1 33 0
	uxth	r2, r2
	orr	r2, r2, #1
	strh	r2, [r3]	@ movhi
	.loc 1 34 0
	bx	lr
.L4:
	.align	2
.L3:
	.word	1073887232
	.word	1073763328
	.word	1073873920
	.cfi_endproc
.LFE110:
	.size	I2C_Conf, .-I2C_Conf
	.align	2
	.global	I2C_Start
	.thumb
	.thumb_func
	.type	I2C_Start, %function
I2C_Start:
.LFB111:
	.loc 1 37 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 38 0
	ldr	r2, .L10
	ldrh	r3, [r2]
	uxth	r3, r3
	orr	r3, r3, #1024
	strh	r3, [r2]	@ movhi
	.loc 1 39 0
	ldrh	r3, [r2]
	uxth	r3, r3
	orr	r3, r3, #256
	strh	r3, [r2]	@ movhi
.L6:
	.loc 1 40 0 discriminator 1
	ldrh	r3, [r2, #20]
	lsls	r3, r3, #31
	bpl	.L6
	.loc 1 42 0
	bx	lr
.L11:
	.align	2
.L10:
	.word	1073763328
	.cfi_endproc
.LFE111:
	.size	I2C_Start, .-I2C_Start
	.align	2
	.global	I2C_Send8bit
	.thumb
	.thumb_func
	.type	I2C_Send8bit, %function
I2C_Send8bit:
.LFB112:
	.loc 1 44 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	.loc 1 45 0
	ldr	r1, .L19
.L13:
	.loc 1 45 0 is_stmt 0 discriminator 1
	ldrh	r2, [r1, #20]
	ldr	r3, .L19
	lsls	r2, r2, #24
	bpl	.L13
	.loc 1 46 0 is_stmt 1
	uxth	r0, r0
.LVL1:
	strh	r0, [r3, #16]	@ movhi
.L14:
	.loc 1 47 0 discriminator 1
	ldrh	r2, [r3, #20]
	lsls	r2, r2, #29
	bpl	.L14
	.loc 1 49 0
	bx	lr
.L20:
	.align	2
.L19:
	.word	1073763328
	.cfi_endproc
.LFE112:
	.size	I2C_Send8bit, .-I2C_Send8bit
	.align	2
	.global	I2C_Send_Addr
	.thumb
	.thumb_func
	.type	I2C_Send_Addr, %function
I2C_Send_Addr:
.LFB113:
	.loc 1 51 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL2:
	sub	sp, sp, #8
	.cfi_def_cfa_offset 8
	.loc 1 52 0
	ldr	r2, .L26
	.loc 1 51 0
	strb	r0, [sp, #7]
	.loc 1 52 0
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
.LVL3:
	strh	r3, [r2, #16]	@ movhi
.L22:
	.loc 1 53 0 discriminator 1
	ldrh	r3, [r2, #20]
	ldr	r1, .L26
	lsls	r3, r3, #30
	bpl	.L22
	.loc 1 54 0
	ldrh	r3, [r1, #20]
	ldrh	r1, [r1, #24]
	ldr	r2, .L26+4
	orrs	r3, r3, r1
	strb	r3, [r2]
	.loc 1 55 0
	add	sp, sp, #8
	.cfi_def_cfa_offset 0
	@ sp needed
	bx	lr
.L27:
	.align	2
.L26:
	.word	1073763328
	.word	clc
	.cfi_endproc
.LFE113:
	.size	I2C_Send_Addr, .-I2C_Send_Addr
	.align	2
	.global	I2C_Receive8bit
	.thumb
	.thumb_func
	.type	I2C_Receive8bit, %function
I2C_Receive8bit:
.LFB114:
	.loc 1 57 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL4:
	.loc 1 60 0
	ldr	r2, .L34
	ldrh	r3, [r2]
	.loc 1 58 0
	cbz	r0, .L29
	.loc 1 60 0
	uxth	r3, r3
	orr	r3, r3, #1024
	strh	r3, [r2]	@ movhi
.L30:
	.loc 1 66 0 discriminator 1
	ldr	r1, .L34
.L31:
	ldrh	r3, [r1, #20]
	ldr	r2, .L34
	lsls	r3, r3, #25
	bpl	.L31
	.loc 1 67 0
	ldrh	r0, [r2, #16]
.LVL5:
	.loc 1 69 0
	uxtb	r0, r0
	bx	lr
.LVL6:
.L29:
	.loc 1 64 0
	bic	r3, r3, #1024
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	strh	r3, [r2]	@ movhi
	b	.L30
.L35:
	.align	2
.L34:
	.word	1073763328
	.cfi_endproc
.LFE114:
	.size	I2C_Receive8bit, .-I2C_Receive8bit
	.align	2
	.global	I2C_Stop
	.thumb
	.thumb_func
	.type	I2C_Stop, %function
I2C_Stop:
.LFB115:
	.loc 1 72 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 73 0
	ldr	r2, .L39
	ldrh	r3, [r2]
	uxth	r3, r3
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
.L37:
	.loc 1 74 0 discriminator 1
	ldrh	r3, [r2]
	lsls	r3, r3, #22
	bmi	.L37
	.loc 1 75 0
	bx	lr
.L40:
	.align	2
.L39:
	.word	1073763328
	.cfi_endproc
.LFE115:
	.size	I2C_Stop, .-I2C_Stop
	.comm	clc,1,1
.Letext0:
	.file 2 "/home/amar/msut/STM32F407/gcc-arm-none-eabi/arm-none-eabi/include/machine/_default_types.h"
	.file 3 "/home/amar/msut/STM32F407/gcc-arm-none-eabi/arm-none-eabi/include/stdint.h"
	.file 4 "../../../STM32F407/Libraries/CMSIS/ST/STM32F4xx/Include/stm32f4xx.h"
	.file 5 "../../../STM32F407/Libraries/CMSIS/Include/core_cm4.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x4fb
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF68
	.byte	0x1
	.4byte	.LASF69
	.4byte	.LASF70
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x2
	.byte	0x1d
	.4byte	0x37
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x2
	.byte	0x2b
	.4byte	0x50
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x3
	.4byte	.LASF6
	.byte	0x2
	.byte	0x3f
	.4byte	0x62
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x3
	.4byte	.LASF8
	.byte	0x2
	.byte	0x41
	.4byte	0x74
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF10
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF12
	.uleb128 0x3
	.4byte	.LASF13
	.byte	0x3
	.byte	0x15
	.4byte	0x2c
	.uleb128 0x3
	.4byte	.LASF14
	.byte	0x3
	.byte	0x21
	.4byte	0x45
	.uleb128 0x3
	.4byte	.LASF15
	.byte	0x3
	.byte	0x2c
	.4byte	0x57
	.uleb128 0x3
	.4byte	.LASF16
	.byte	0x3
	.byte	0x2d
	.4byte	0x69
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF17
	.uleb128 0x5
	.4byte	0xb8
	.uleb128 0x6
	.4byte	0xb8
	.4byte	0xdf
	.uleb128 0x7
	.4byte	0xc3
	.byte	0x1
	.byte	0
	.uleb128 0x5
	.4byte	0x97
	.uleb128 0x5
	.4byte	0xa2
	.uleb128 0x5
	.4byte	0xad
	.uleb128 0x8
	.byte	0x28
	.byte	0x4
	.2byte	0x28e
	.4byte	0x17a
	.uleb128 0x9
	.4byte	.LASF18
	.byte	0x4
	.2byte	0x290
	.4byte	0xca
	.byte	0
	.uleb128 0x9
	.4byte	.LASF19
	.byte	0x4
	.2byte	0x291
	.4byte	0xca
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x292
	.4byte	0xca
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF21
	.byte	0x4
	.2byte	0x293
	.4byte	0xca
	.byte	0xc
	.uleb128 0xa
	.ascii	"IDR\000"
	.byte	0x4
	.2byte	0x294
	.4byte	0xca
	.byte	0x10
	.uleb128 0xa
	.ascii	"ODR\000"
	.byte	0x4
	.2byte	0x295
	.4byte	0xca
	.byte	0x14
	.uleb128 0x9
	.4byte	.LASF22
	.byte	0x4
	.2byte	0x296
	.4byte	0xe4
	.byte	0x18
	.uleb128 0x9
	.4byte	.LASF23
	.byte	0x4
	.2byte	0x297
	.4byte	0xe4
	.byte	0x1a
	.uleb128 0x9
	.4byte	.LASF24
	.byte	0x4
	.2byte	0x298
	.4byte	0xca
	.byte	0x1c
	.uleb128 0xa
	.ascii	"AFR\000"
	.byte	0x4
	.2byte	0x299
	.4byte	0x17a
	.byte	0x20
	.byte	0
	.uleb128 0x5
	.4byte	0xcf
	.uleb128 0xb
	.4byte	.LASF25
	.byte	0x4
	.2byte	0x29a
	.4byte	0xee
	.uleb128 0x8
	.byte	0x24
	.byte	0x4
	.2byte	0x2ad
	.4byte	0x27e
	.uleb128 0xa
	.ascii	"CR1\000"
	.byte	0x4
	.2byte	0x2af
	.4byte	0xe4
	.byte	0
	.uleb128 0x9
	.4byte	.LASF26
	.byte	0x4
	.2byte	0x2b0
	.4byte	0xa2
	.byte	0x2
	.uleb128 0xa
	.ascii	"CR2\000"
	.byte	0x4
	.2byte	0x2b1
	.4byte	0xe4
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF27
	.byte	0x4
	.2byte	0x2b2
	.4byte	0xa2
	.byte	0x6
	.uleb128 0x9
	.4byte	.LASF28
	.byte	0x4
	.2byte	0x2b3
	.4byte	0xe4
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF29
	.byte	0x4
	.2byte	0x2b4
	.4byte	0xa2
	.byte	0xa
	.uleb128 0x9
	.4byte	.LASF30
	.byte	0x4
	.2byte	0x2b5
	.4byte	0xe4
	.byte	0xc
	.uleb128 0x9
	.4byte	.LASF31
	.byte	0x4
	.2byte	0x2b6
	.4byte	0xa2
	.byte	0xe
	.uleb128 0xa
	.ascii	"DR\000"
	.byte	0x4
	.2byte	0x2b7
	.4byte	0xe4
	.byte	0x10
	.uleb128 0x9
	.4byte	.LASF32
	.byte	0x4
	.2byte	0x2b8
	.4byte	0xa2
	.byte	0x12
	.uleb128 0xa
	.ascii	"SR1\000"
	.byte	0x4
	.2byte	0x2b9
	.4byte	0xe4
	.byte	0x14
	.uleb128 0x9
	.4byte	.LASF33
	.byte	0x4
	.2byte	0x2ba
	.4byte	0xa2
	.byte	0x16
	.uleb128 0xa
	.ascii	"SR2\000"
	.byte	0x4
	.2byte	0x2bb
	.4byte	0xe4
	.byte	0x18
	.uleb128 0x9
	.4byte	.LASF34
	.byte	0x4
	.2byte	0x2bc
	.4byte	0xa2
	.byte	0x1a
	.uleb128 0xa
	.ascii	"CCR\000"
	.byte	0x4
	.2byte	0x2bd
	.4byte	0xe4
	.byte	0x1c
	.uleb128 0x9
	.4byte	.LASF35
	.byte	0x4
	.2byte	0x2be
	.4byte	0xa2
	.byte	0x1e
	.uleb128 0x9
	.4byte	.LASF36
	.byte	0x4
	.2byte	0x2bf
	.4byte	0xe4
	.byte	0x20
	.uleb128 0x9
	.4byte	.LASF37
	.byte	0x4
	.2byte	0x2c0
	.4byte	0xa2
	.byte	0x22
	.byte	0
	.uleb128 0xb
	.4byte	.LASF38
	.byte	0x4
	.2byte	0x2c1
	.4byte	0x18b
	.uleb128 0x8
	.byte	0x88
	.byte	0x4
	.2byte	0x2dd
	.4byte	0x419
	.uleb128 0xa
	.ascii	"CR\000"
	.byte	0x4
	.2byte	0x2df
	.4byte	0xca
	.byte	0
	.uleb128 0x9
	.4byte	.LASF39
	.byte	0x4
	.2byte	0x2e0
	.4byte	0xca
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF40
	.byte	0x4
	.2byte	0x2e1
	.4byte	0xca
	.byte	0x8
	.uleb128 0xa
	.ascii	"CIR\000"
	.byte	0x4
	.2byte	0x2e2
	.4byte	0xca
	.byte	0xc
	.uleb128 0x9
	.4byte	.LASF41
	.byte	0x4
	.2byte	0x2e3
	.4byte	0xca
	.byte	0x10
	.uleb128 0x9
	.4byte	.LASF42
	.byte	0x4
	.2byte	0x2e4
	.4byte	0xca
	.byte	0x14
	.uleb128 0x9
	.4byte	.LASF43
	.byte	0x4
	.2byte	0x2e5
	.4byte	0xca
	.byte	0x18
	.uleb128 0x9
	.4byte	.LASF26
	.byte	0x4
	.2byte	0x2e6
	.4byte	0xb8
	.byte	0x1c
	.uleb128 0x9
	.4byte	.LASF44
	.byte	0x4
	.2byte	0x2e7
	.4byte	0xca
	.byte	0x20
	.uleb128 0x9
	.4byte	.LASF45
	.byte	0x4
	.2byte	0x2e8
	.4byte	0xca
	.byte	0x24
	.uleb128 0x9
	.4byte	.LASF27
	.byte	0x4
	.2byte	0x2e9
	.4byte	0xcf
	.byte	0x28
	.uleb128 0x9
	.4byte	.LASF46
	.byte	0x4
	.2byte	0x2ea
	.4byte	0xca
	.byte	0x30
	.uleb128 0x9
	.4byte	.LASF47
	.byte	0x4
	.2byte	0x2eb
	.4byte	0xca
	.byte	0x34
	.uleb128 0x9
	.4byte	.LASF48
	.byte	0x4
	.2byte	0x2ec
	.4byte	0xca
	.byte	0x38
	.uleb128 0x9
	.4byte	.LASF29
	.byte	0x4
	.2byte	0x2ed
	.4byte	0xb8
	.byte	0x3c
	.uleb128 0x9
	.4byte	.LASF49
	.byte	0x4
	.2byte	0x2ee
	.4byte	0xca
	.byte	0x40
	.uleb128 0x9
	.4byte	.LASF50
	.byte	0x4
	.2byte	0x2ef
	.4byte	0xca
	.byte	0x44
	.uleb128 0x9
	.4byte	.LASF31
	.byte	0x4
	.2byte	0x2f0
	.4byte	0xcf
	.byte	0x48
	.uleb128 0x9
	.4byte	.LASF51
	.byte	0x4
	.2byte	0x2f1
	.4byte	0xca
	.byte	0x50
	.uleb128 0x9
	.4byte	.LASF52
	.byte	0x4
	.2byte	0x2f2
	.4byte	0xca
	.byte	0x54
	.uleb128 0x9
	.4byte	.LASF53
	.byte	0x4
	.2byte	0x2f3
	.4byte	0xca
	.byte	0x58
	.uleb128 0x9
	.4byte	.LASF32
	.byte	0x4
	.2byte	0x2f4
	.4byte	0xb8
	.byte	0x5c
	.uleb128 0x9
	.4byte	.LASF54
	.byte	0x4
	.2byte	0x2f5
	.4byte	0xca
	.byte	0x60
	.uleb128 0x9
	.4byte	.LASF55
	.byte	0x4
	.2byte	0x2f6
	.4byte	0xca
	.byte	0x64
	.uleb128 0x9
	.4byte	.LASF33
	.byte	0x4
	.2byte	0x2f7
	.4byte	0xcf
	.byte	0x68
	.uleb128 0x9
	.4byte	.LASF56
	.byte	0x4
	.2byte	0x2f8
	.4byte	0xca
	.byte	0x70
	.uleb128 0xa
	.ascii	"CSR\000"
	.byte	0x4
	.2byte	0x2f9
	.4byte	0xca
	.byte	0x74
	.uleb128 0x9
	.4byte	.LASF34
	.byte	0x4
	.2byte	0x2fa
	.4byte	0xcf
	.byte	0x78
	.uleb128 0x9
	.4byte	.LASF57
	.byte	0x4
	.2byte	0x2fb
	.4byte	0xca
	.byte	0x80
	.uleb128 0x9
	.4byte	.LASF58
	.byte	0x4
	.2byte	0x2fc
	.4byte	0xca
	.byte	0x84
	.byte	0
	.uleb128 0xb
	.4byte	.LASF59
	.byte	0x4
	.2byte	0x2fd
	.4byte	0x28a
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF60
	.uleb128 0xc
	.4byte	.LASF71
	.byte	0x1
	.byte	0x8
	.4byte	.LFB110
	.4byte	.LFE110-.LFB110
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xd
	.4byte	.LASF65
	.byte	0x1
	.byte	0x25
	.4byte	.LFB111
	.4byte	.LFE111-.LFB111
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xe
	.4byte	.LASF61
	.byte	0x1
	.byte	0x2c
	.4byte	.LFB112
	.4byte	.LFE112-.LFB112
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x473
	.uleb128 0xf
	.4byte	.LASF63
	.byte	0x1
	.byte	0x2c
	.4byte	0x97
	.4byte	.LLST0
	.byte	0
	.uleb128 0xe
	.4byte	.LASF62
	.byte	0x1
	.byte	0x33
	.4byte	.LFB113
	.4byte	.LFE113-.LFB113
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x498
	.uleb128 0xf
	.4byte	.LASF64
	.byte	0x1
	.byte	0x33
	.4byte	0xdf
	.4byte	.LLST1
	.byte	0
	.uleb128 0x10
	.4byte	.LASF72
	.byte	0x1
	.byte	0x39
	.4byte	0x97
	.4byte	.LFB114
	.4byte	.LFE114-.LFB114
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4d0
	.uleb128 0x11
	.ascii	"ack\000"
	.byte	0x1
	.byte	0x39
	.4byte	0x97
	.4byte	.LLST2
	.uleb128 0x12
	.4byte	.LASF63
	.byte	0x1
	.byte	0x43
	.4byte	0x97
	.4byte	.LLST3
	.byte	0
	.uleb128 0xd
	.4byte	.LASF66
	.byte	0x1
	.byte	0x48
	.4byte	.LFB115
	.4byte	.LFE115-.LFB115
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x13
	.4byte	.LASF67
	.byte	0x5
	.2byte	0x51b
	.4byte	0xe9
	.uleb128 0x14
	.ascii	"clc\000"
	.byte	0x1
	.byte	0x6
	.4byte	0x97
	.uleb128 0x5
	.byte	0x3
	.4byte	clc
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL1-.Ltext0
	.4byte	.LFE112-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL4-.Ltext0
	.4byte	.LVL5-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL6-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL6-.Ltext0
	.4byte	.LFE114-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF51:
	.ascii	"AHB1LPENR\000"
.LASF20:
	.ascii	"OSPEEDR\000"
.LASF69:
	.ascii	"i2c.c\000"
.LASF47:
	.ascii	"AHB2ENR\000"
.LASF64:
	.ascii	"Addr\000"
.LASF17:
	.ascii	"sizetype\000"
.LASF56:
	.ascii	"BDCR\000"
.LASF58:
	.ascii	"PLLI2SCFGR\000"
.LASF8:
	.ascii	"__uint32_t\000"
.LASF44:
	.ascii	"APB1RSTR\000"
.LASF4:
	.ascii	"__uint16_t\000"
.LASF57:
	.ascii	"SSCGR\000"
.LASF2:
	.ascii	"short int\000"
.LASF41:
	.ascii	"AHB1RSTR\000"
.LASF40:
	.ascii	"CFGR\000"
.LASF53:
	.ascii	"AHB3LPENR\000"
.LASF13:
	.ascii	"uint8_t\000"
.LASF49:
	.ascii	"APB1ENR\000"
.LASF68:
	.ascii	"GNU C 4.9.3 20141119 (release) [ARM/embedded-4_9-br"
	.ascii	"anch revision 218278] -mlittle-endian -mthumb -mcpu"
	.ascii	"=cortex-m4 -mthumb-interwork -mfloat-abi=hard -mfpu"
	.ascii	"=fpv4-sp-d16 -g -O2 -fsingle-precision-constant\000"
.LASF19:
	.ascii	"OTYPER\000"
.LASF48:
	.ascii	"AHB3ENR\000"
.LASF10:
	.ascii	"long long int\000"
.LASF21:
	.ascii	"PUPDR\000"
.LASF7:
	.ascii	"long int\000"
.LASF59:
	.ascii	"RCC_TypeDef\000"
.LASF23:
	.ascii	"BSRRH\000"
.LASF18:
	.ascii	"MODER\000"
.LASF45:
	.ascii	"APB2RSTR\000"
.LASF3:
	.ascii	"__uint8_t\000"
.LASF61:
	.ascii	"I2C_Send8bit\000"
.LASF66:
	.ascii	"I2C_Stop\000"
.LASF38:
	.ascii	"I2C_TypeDef\000"
.LASF62:
	.ascii	"I2C_Send_Addr\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF50:
	.ascii	"APB2ENR\000"
.LASF72:
	.ascii	"I2C_Receive8bit\000"
.LASF0:
	.ascii	"signed char\000"
.LASF11:
	.ascii	"long long unsigned int\000"
.LASF16:
	.ascii	"uint32_t\000"
.LASF71:
	.ascii	"I2C_Conf\000"
.LASF12:
	.ascii	"unsigned int\000"
.LASF42:
	.ascii	"AHB2RSTR\000"
.LASF14:
	.ascii	"uint16_t\000"
.LASF9:
	.ascii	"long unsigned int\000"
.LASF39:
	.ascii	"PLLCFGR\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF54:
	.ascii	"APB1LPENR\000"
.LASF60:
	.ascii	"char\000"
.LASF15:
	.ascii	"int32_t\000"
.LASF70:
	.ascii	"/home/amar/msut/STM32F407/MSUT_Zavrsni/MAX30102_I2C"
	.ascii	"\000"
.LASF28:
	.ascii	"OAR1\000"
.LASF30:
	.ascii	"OAR2\000"
.LASF63:
	.ascii	"data\000"
.LASF52:
	.ascii	"AHB2LPENR\000"
.LASF26:
	.ascii	"RESERVED0\000"
.LASF27:
	.ascii	"RESERVED1\000"
.LASF29:
	.ascii	"RESERVED2\000"
.LASF31:
	.ascii	"RESERVED3\000"
.LASF32:
	.ascii	"RESERVED4\000"
.LASF33:
	.ascii	"RESERVED5\000"
.LASF34:
	.ascii	"RESERVED6\000"
.LASF35:
	.ascii	"RESERVED7\000"
.LASF37:
	.ascii	"RESERVED8\000"
.LASF67:
	.ascii	"ITM_RxBuffer\000"
.LASF46:
	.ascii	"AHB1ENR\000"
.LASF6:
	.ascii	"__int32_t\000"
.LASF25:
	.ascii	"GPIO_TypeDef\000"
.LASF43:
	.ascii	"AHB3RSTR\000"
.LASF36:
	.ascii	"TRISE\000"
.LASF22:
	.ascii	"BSRRL\000"
.LASF65:
	.ascii	"I2C_Start\000"
.LASF24:
	.ascii	"LCKR\000"
.LASF55:
	.ascii	"APB2LPENR\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.9.3 20141119 (release) [ARM/embedded-4_9-branch revision 218278]"
