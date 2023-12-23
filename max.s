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
	.file	"max.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	MAX_Init
	.thumb
	.thumb_func
	.type	MAX_Init, %function
MAX_Init:
.LFB110:
	.file 1 "max.c"
	.loc 1 11 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 12 0
	movs	r0, #5
	bl	delay_ms
.LVL0:
	.loc 1 13 0
	bl	I2C_Start
.LVL1:
	.loc 1 14 0
	movs	r0, #174
	bl	I2C_Send_Addr
.LVL2:
	.loc 1 15 0
	movs	r0, #9
	bl	I2C_Send8bit
.LVL3:
	.loc 1 16 0
	movs	r0, #2
	bl	I2C_Send8bit
.LVL4:
	.loc 1 17 0
	bl	I2C_Stop
.LVL5:
	.loc 1 19 0
	movs	r0, #5
	bl	delay_ms
.LVL6:
	.loc 1 20 0
	bl	I2C_Start
.LVL7:
	.loc 1 21 0
	movs	r0, #174
	bl	I2C_Send_Addr
.LVL8:
	.loc 1 22 0
	movs	r0, #12
	bl	I2C_Send8bit
.LVL9:
	.loc 1 23 0
	movs	r0, #31
	bl	I2C_Send8bit
.LVL10:
	.loc 1 24 0
	bl	I2C_Stop
.LVL11:
	.loc 1 26 0
	movs	r0, #5
	bl	delay_ms
.LVL12:
	.loc 1 27 0
	bl	I2C_Start
.LVL13:
	.loc 1 28 0
	movs	r0, #174
	bl	I2C_Send_Addr
.LVL14:
	.loc 1 29 0
	movs	r0, #4
	bl	I2C_Send8bit
.LVL15:
	.loc 1 30 0
	movs	r0, #0
	bl	I2C_Send8bit
.LVL16:
	.loc 1 31 0
	bl	I2C_Stop
.LVL17:
	.loc 1 33 0
	movs	r0, #5
	bl	delay_ms
.LVL18:
	.loc 1 35 0
	bl	I2C_Start
.LVL19:
	.loc 1 36 0
	movs	r0, #174
	bl	I2C_Send_Addr
.LVL20:
	.loc 1 37 0
	movs	r0, #6
	bl	I2C_Send8bit
.LVL21:
	.loc 1 38 0
	movs	r0, #0
	bl	I2C_Send8bit
.LVL22:
	.loc 1 39 0
	bl	I2C_Stop
.LVL23:
	.loc 1 41 0
	movs	r0, #5
	bl	delay_ms
.LVL24:
	.loc 1 43 0
	bl	I2C_Start
.LVL25:
	.loc 1 44 0
	movs	r0, #174
	bl	I2C_Send_Addr
.LVL26:
	.loc 1 45 0
	movs	r0, #5
	bl	I2C_Send8bit
.LVL27:
	.loc 1 46 0
	movs	r0, #0
	bl	I2C_Send8bit
.LVL28:
	.loc 1 47 0
	bl	I2C_Stop
.LVL29:
	.loc 1 49 0
	movs	r0, #5
	bl	delay_ms
.LVL30:
	.loc 1 51 0
	bl	I2C_Start
.LVL31:
	.loc 1 52 0
	movs	r0, #174
	bl	I2C_Send_Addr
.LVL32:
	.loc 1 53 0
	movs	r0, #8
	bl	I2C_Send8bit
.LVL33:
	.loc 1 54 0
	movs	r0, #80
	bl	I2C_Send8bit
.LVL34:
	.loc 1 55 0
	bl	I2C_Stop
.LVL35:
	.loc 1 57 0
	movs	r0, #5
	.loc 1 59 0
	pop	{r3, lr}
	.cfi_restore 14
	.cfi_restore 3
	.cfi_def_cfa_offset 0
	.loc 1 57 0
	b	delay_ms
.LVL36:
	.cfi_endproc
.LFE110:
	.size	MAX_Init, .-MAX_Init
	.align	2
	.global	MAX_ReadRegister
	.thumb
	.thumb_func
	.type	MAX_ReadRegister, %function
MAX_ReadRegister:
.LFB111:
	.loc 1 61 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL37:
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	.loc 1 61 0
	mov	r4, r0
	.loc 1 62 0
	bl	I2C_Start
.LVL38:
	.loc 1 63 0
	movs	r0, #174
	bl	I2C_Send_Addr
.LVL39:
	.loc 1 64 0
	mov	r0, r4
	bl	I2C_Send8bit
.LVL40:
	.loc 1 65 0
	bl	I2C_Start
.LVL41:
	.loc 1 66 0
	movs	r0, #175
	bl	I2C_Send_Addr
.LVL42:
	.loc 1 67 0
	movs	r0, #0
	bl	I2C_Receive8bit
.LVL43:
	mov	r4, r0
.LVL44:
	.loc 1 68 0
	bl	I2C_Stop
.LVL45:
	.loc 1 71 0
	mov	r0, r4
	pop	{r4, pc}
	.cfi_endproc
.LFE111:
	.size	MAX_ReadRegister, .-MAX_ReadRegister
	.align	2
	.global	MAX_ReadFifoReg
	.thumb
	.thumb_func
	.type	MAX_ReadFifoReg, %function
MAX_ReadFifoReg:
.LFB112:
	.loc 1 72 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL46:
	push	{r4, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 4, -8
	.cfi_offset 14, -4
	.loc 1 72 0
	mov	r4, r0
	.loc 1 73 0
	bl	I2C_Start
.LVL47:
	.loc 1 74 0
	movs	r0, #174
	bl	I2C_Send_Addr
.LVL48:
	.loc 1 75 0
	mov	r0, r4
	bl	I2C_Send8bit
.LVL49:
	.loc 1 76 0
	bl	I2C_Start
.LVL50:
	.loc 1 77 0
	movs	r0, #175
	bl	I2C_Send_Addr
.LVL51:
	.loc 1 82 0
	movs	r0, #1
	bl	I2C_Receive8bit
.LVL52:
	.loc 1 83 0
	movs	r0, #1
	bl	I2C_Receive8bit
.LVL53:
	mov	r4, r0
.LVL54:
	.loc 1 84 0
	movs	r0, #0
	bl	I2C_Receive8bit
.LVL55:
	.loc 1 85 0
	orr	r0, r0, r4, lsl #8
.LVL56:
	.loc 1 88 0
	uxth	r0, r0
	pop	{r4, pc}
	.cfi_endproc
.LFE112:
	.size	MAX_ReadFifoReg, .-MAX_ReadFifoReg
	.align	2
	.global	MAX_GetFifoSample
	.thumb
	.thumb_func
	.type	MAX_GetFifoSample, %function
MAX_GetFifoSample:
.LFB113:
	.loc 1 89 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL57:
	push	{r4, r5, r6, r7, lr}
	.cfi_def_cfa_offset 20
	.cfi_offset 4, -20
	.cfi_offset 5, -16
	.cfi_offset 6, -12
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	mov	r6, r0
	sub	sp, sp, #12
	.cfi_def_cfa_offset 32
	.loc 1 90 0
	movs	r0, #6
.LVL58:
	.loc 1 89 0
	mov	r4, r1
	mov	r5, r2
	.loc 1 90 0
	bl	MAX_ReadRegister
.LVL59:
	.loc 1 91 0
	movs	r0, #4
	bl	MAX_ReadRegister
.LVL60:
	.loc 1 92 0
	movs	r3, #0
	.loc 1 99 0
	uxtb	r7, r4
	.loc 1 92 0
	str	r3, [sp, #4]
	.loc 1 93 0
	b	.L9
.L10:
	.loc 1 95 0
	bl	MAX_ReadRegister
.LVL61:
	mov	r4, r0
.LVL62:
	.loc 1 96 0
	movs	r0, #4
	bl	MAX_ReadRegister
.LVL63:
	.loc 1 97 0
	cmp	r0, r4
	bne	.L14
.LVL64:
.L9:
	.loc 1 93 0
	ldr	r3, [sp, #4]
	cmp	r3, r5
	.loc 1 95 0
	mov	r0, #6
	.loc 1 93 0
	blt	.L10
	.loc 1 105 0
	add	sp, sp, #12
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.LVL65:
.L14:
	.cfi_restore_state
	.loc 1 99 0
	movs	r0, #7
.LVL66:
	mov	r1, r7
	ldr	r4, [sp, #4]
.LVL67:
	bl	MAX_ReadFifoReg
.LVL68:
	.loc 1 100 0
	ldr	r3, [sp, #4]
	.loc 1 99 0
	strh	r0, [r6, r4, lsl #1]	@ movhi
	.loc 1 100 0
	adds	r3, r3, #1
	str	r3, [sp, #4]
	b	.L9
	.cfi_endproc
.LFE113:
	.size	MAX_GetFifoSample, .-MAX_GetFifoSample
.Letext0:
	.file 2 "/home/amar/msut/STM32F407/gcc-arm-none-eabi/arm-none-eabi/include/machine/_default_types.h"
	.file 3 "/home/amar/msut/STM32F407/gcc-arm-none-eabi/arm-none-eabi/include/stdint.h"
	.file 4 "delay.h"
	.file 5 "i2c.h"
	.file 6 "../../../STM32F407/Libraries/CMSIS/Include/core_cm4.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x5fd
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF38
	.byte	0x1
	.4byte	.LASF39
	.4byte	.LASF40
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
	.4byte	0xad
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF18
	.uleb128 0x6
	.4byte	.LASF26
	.byte	0x1
	.byte	0xb
	.4byte	.LFB110
	.4byte	.LFE110-.LFB110
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x336
	.uleb128 0x7
	.4byte	.LVL0
	.4byte	0x5a2
	.4byte	0xfe
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x35
	.byte	0
	.uleb128 0x9
	.4byte	.LVL1
	.4byte	0x5b3
	.uleb128 0x7
	.4byte	.LVL2
	.4byte	0x5c0
	.4byte	0x11b
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x9
	.byte	0xae
	.byte	0
	.uleb128 0x7
	.4byte	.LVL3
	.4byte	0x5d1
	.4byte	0x12e
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x39
	.byte	0
	.uleb128 0x7
	.4byte	.LVL4
	.4byte	0x5d1
	.4byte	0x141
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x32
	.byte	0
	.uleb128 0x9
	.4byte	.LVL5
	.4byte	0x5e2
	.uleb128 0x7
	.4byte	.LVL6
	.4byte	0x5a2
	.4byte	0x15d
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x35
	.byte	0
	.uleb128 0x9
	.4byte	.LVL7
	.4byte	0x5b3
	.uleb128 0x7
	.4byte	.LVL8
	.4byte	0x5c0
	.4byte	0x17a
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x9
	.byte	0xae
	.byte	0
	.uleb128 0x7
	.4byte	.LVL9
	.4byte	0x5d1
	.4byte	0x18d
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x3c
	.byte	0
	.uleb128 0x7
	.4byte	.LVL10
	.4byte	0x5d1
	.4byte	0x1a0
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x4f
	.byte	0
	.uleb128 0x9
	.4byte	.LVL11
	.4byte	0x5e2
	.uleb128 0x7
	.4byte	.LVL12
	.4byte	0x5a2
	.4byte	0x1bc
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x35
	.byte	0
	.uleb128 0x9
	.4byte	.LVL13
	.4byte	0x5b3
	.uleb128 0x7
	.4byte	.LVL14
	.4byte	0x5c0
	.4byte	0x1d9
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x9
	.byte	0xae
	.byte	0
	.uleb128 0x7
	.4byte	.LVL15
	.4byte	0x5d1
	.4byte	0x1ec
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x34
	.byte	0
	.uleb128 0x7
	.4byte	.LVL16
	.4byte	0x5d1
	.4byte	0x1ff
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x9
	.4byte	.LVL17
	.4byte	0x5e2
	.uleb128 0x7
	.4byte	.LVL18
	.4byte	0x5a2
	.4byte	0x21b
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x35
	.byte	0
	.uleb128 0x9
	.4byte	.LVL19
	.4byte	0x5b3
	.uleb128 0x7
	.4byte	.LVL20
	.4byte	0x5c0
	.4byte	0x238
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x9
	.byte	0xae
	.byte	0
	.uleb128 0x7
	.4byte	.LVL21
	.4byte	0x5d1
	.4byte	0x24b
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x36
	.byte	0
	.uleb128 0x7
	.4byte	.LVL22
	.4byte	0x5d1
	.4byte	0x25e
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x9
	.4byte	.LVL23
	.4byte	0x5e2
	.uleb128 0x7
	.4byte	.LVL24
	.4byte	0x5a2
	.4byte	0x27a
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x35
	.byte	0
	.uleb128 0x9
	.4byte	.LVL25
	.4byte	0x5b3
	.uleb128 0x7
	.4byte	.LVL26
	.4byte	0x5c0
	.4byte	0x297
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x9
	.byte	0xae
	.byte	0
	.uleb128 0x7
	.4byte	.LVL27
	.4byte	0x5d1
	.4byte	0x2aa
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x35
	.byte	0
	.uleb128 0x7
	.4byte	.LVL28
	.4byte	0x5d1
	.4byte	0x2bd
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x9
	.4byte	.LVL29
	.4byte	0x5e2
	.uleb128 0x7
	.4byte	.LVL30
	.4byte	0x5a2
	.4byte	0x2d9
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x35
	.byte	0
	.uleb128 0x9
	.4byte	.LVL31
	.4byte	0x5b3
	.uleb128 0x7
	.4byte	.LVL32
	.4byte	0x5c0
	.4byte	0x2f6
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x9
	.byte	0xae
	.byte	0
	.uleb128 0x7
	.4byte	.LVL33
	.4byte	0x5d1
	.4byte	0x309
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x38
	.byte	0
	.uleb128 0x7
	.4byte	.LVL34
	.4byte	0x5d1
	.4byte	0x31d
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x8
	.byte	0x50
	.byte	0
	.uleb128 0x9
	.4byte	.LVL35
	.4byte	0x5e2
	.uleb128 0xa
	.4byte	.LVL36
	.4byte	0x5a2
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x35
	.byte	0
	.byte	0
	.uleb128 0xb
	.4byte	.LASF19
	.byte	0x1
	.byte	0x3d
	.4byte	0x97
	.4byte	.LFB111
	.4byte	.LFE111-.LFB111
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3d6
	.uleb128 0xc
	.4byte	.LASF21
	.byte	0x1
	.byte	0x3d
	.4byte	0x97
	.4byte	.LLST0
	.uleb128 0xd
	.4byte	.LASF23
	.byte	0x1
	.byte	0x43
	.4byte	0x97
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.4byte	.LVL38
	.4byte	0x5b3
	.uleb128 0x7
	.4byte	.LVL39
	.4byte	0x5c0
	.4byte	0x388
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x9
	.byte	0xae
	.byte	0
	.uleb128 0x7
	.4byte	.LVL40
	.4byte	0x5d1
	.4byte	0x39c
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x9
	.4byte	.LVL41
	.4byte	0x5b3
	.uleb128 0x7
	.4byte	.LVL42
	.4byte	0x5c0
	.4byte	0x3b9
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x9
	.byte	0xaf
	.byte	0
	.uleb128 0x7
	.4byte	.LVL43
	.4byte	0x5ef
	.4byte	0x3cc
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x9
	.4byte	.LVL45
	.4byte	0x5e2
	.byte	0
	.uleb128 0xb
	.4byte	.LASF20
	.byte	0x1
	.byte	0x48
	.4byte	0xa2
	.4byte	.LFB112
	.4byte	.LFE112-.LFB112
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4c7
	.uleb128 0xc
	.4byte	.LASF21
	.byte	0x1
	.byte	0x48
	.4byte	0x97
	.4byte	.LLST1
	.uleb128 0xc
	.4byte	.LASF22
	.byte	0x1
	.byte	0x48
	.4byte	0x97
	.4byte	.LLST2
	.uleb128 0xe
	.4byte	.LASF41
	.byte	0x1
	.byte	0x4e
	.4byte	0x97
	.uleb128 0xd
	.4byte	.LASF24
	.byte	0x1
	.byte	0x4f
	.4byte	0x97
	.uleb128 0x1
	.byte	0x54
	.uleb128 0xf
	.4byte	.LASF25
	.byte	0x1
	.byte	0x50
	.4byte	0x97
	.4byte	.LLST3
	.uleb128 0xf
	.4byte	.LASF23
	.byte	0x1
	.byte	0x51
	.4byte	0xa2
	.4byte	.LLST4
	.uleb128 0x9
	.4byte	.LVL47
	.4byte	0x5b3
	.uleb128 0x7
	.4byte	.LVL48
	.4byte	0x5c0
	.4byte	0x460
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x9
	.byte	0xae
	.byte	0
	.uleb128 0x7
	.4byte	.LVL49
	.4byte	0x5d1
	.4byte	0x474
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x9
	.4byte	.LVL50
	.4byte	0x5b3
	.uleb128 0x7
	.4byte	.LVL51
	.4byte	0x5c0
	.4byte	0x491
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x9
	.byte	0xaf
	.byte	0
	.uleb128 0x7
	.4byte	.LVL52
	.4byte	0x5ef
	.4byte	0x4a4
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x7
	.4byte	.LVL53
	.4byte	0x5ef
	.4byte	0x4b7
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x10
	.4byte	.LVL55
	.4byte	0x5ef
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x6
	.4byte	.LASF27
	.byte	0x1
	.byte	0x59
	.4byte	.LFB113
	.4byte	.LFE113-.LFB113
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x58b
	.uleb128 0xc
	.4byte	.LASF23
	.byte	0x1
	.byte	0x59
	.4byte	0x58b
	.4byte	.LLST5
	.uleb128 0xc
	.4byte	.LASF28
	.byte	0x1
	.byte	0x59
	.4byte	0xa2
	.4byte	.LLST6
	.uleb128 0xc
	.4byte	.LASF29
	.byte	0x1
	.byte	0x59
	.4byte	0x97
	.4byte	.LLST7
	.uleb128 0xf
	.4byte	.LASF30
	.byte	0x1
	.byte	0x5a
	.4byte	0x97
	.4byte	.LLST8
	.uleb128 0xf
	.4byte	.LASF31
	.byte	0x1
	.byte	0x5b
	.4byte	0x97
	.4byte	.LLST9
	.uleb128 0x11
	.ascii	"i\000"
	.byte	0x1
	.byte	0x5c
	.4byte	0x591
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x7
	.4byte	.LVL59
	.4byte	0x336
	.4byte	0x546
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x36
	.byte	0
	.uleb128 0x7
	.4byte	.LVL60
	.4byte	0x336
	.4byte	0x559
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x34
	.byte	0
	.uleb128 0x9
	.4byte	.LVL61
	.4byte	0x336
	.uleb128 0x7
	.4byte	.LVL63
	.4byte	0x336
	.4byte	0x575
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x34
	.byte	0
	.uleb128 0x10
	.4byte	.LVL68
	.4byte	0x3d6
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x37
	.byte	0
	.byte	0
	.uleb128 0x12
	.byte	0x4
	.4byte	0xa2
	.uleb128 0x5
	.4byte	0x89
	.uleb128 0x13
	.4byte	.LASF42
	.byte	0x6
	.2byte	0x51b
	.4byte	0xca
	.uleb128 0x14
	.4byte	.LASF32
	.byte	0x4
	.byte	0xb
	.4byte	0x5b3
	.uleb128 0x15
	.4byte	0xb8
	.byte	0
	.uleb128 0x16
	.4byte	.LASF35
	.byte	0x5
	.byte	0x6
	.4byte	0x5c0
	.uleb128 0x17
	.byte	0
	.uleb128 0x14
	.4byte	.LASF33
	.byte	0x5
	.byte	0x8
	.4byte	0x5d1
	.uleb128 0x15
	.4byte	0x97
	.byte	0
	.uleb128 0x14
	.4byte	.LASF34
	.byte	0x5
	.byte	0x7
	.4byte	0x5e2
	.uleb128 0x15
	.4byte	0x97
	.byte	0
	.uleb128 0x16
	.4byte	.LASF36
	.byte	0x5
	.byte	0xb
	.4byte	0x5ef
	.uleb128 0x17
	.byte	0
	.uleb128 0x18
	.4byte	.LASF37
	.byte	0x5
	.byte	0x9
	.4byte	0x97
	.uleb128 0x15
	.4byte	0x97
	.byte	0
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
	.uleb128 0x7
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0x19
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL37-.Ltext0
	.4byte	.LVL38-1-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL38-1-.Ltext0
	.4byte	.LFE111-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL46-.Ltext0
	.4byte	.LVL47-1-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL47-1-.Ltext0
	.4byte	.LFE112-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL46-.Ltext0
	.4byte	.LVL47-1-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL47-1-.Ltext0
	.4byte	.LFE112-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL55-.Ltext0
	.4byte	.LVL56-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL55-.Ltext0
	.4byte	.LVL56-.Ltext0
	.2byte	0xe
	.byte	0x74
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x38
	.byte	0x24
	.byte	0x70
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x21
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL57-.Ltext0
	.4byte	.LVL58-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL58-.Ltext0
	.4byte	.LFE113-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL57-.Ltext0
	.4byte	.LVL59-1-.Ltext0
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL59-1-.Ltext0
	.4byte	.LFE113-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL57-.Ltext0
	.4byte	.LVL59-1-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL59-1-.Ltext0
	.4byte	.LFE113-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL62-.Ltext0
	.4byte	.LVL64-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL65-.Ltext0
	.4byte	.LVL67-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL63-.Ltext0
	.4byte	.LVL64-.Ltext0
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL65-.Ltext0
	.4byte	.LVL66-.Ltext0
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
.LASF10:
	.ascii	"long long int\000"
.LASF3:
	.ascii	"__uint8_t\000"
.LASF34:
	.ascii	"I2C_Send8bit\000"
.LASF6:
	.ascii	"__int32_t\000"
.LASF20:
	.ascii	"MAX_ReadFifoReg\000"
.LASF28:
	.ascii	"numBytes\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF25:
	.ascii	"lByte\000"
.LASF24:
	.ascii	"hByte\000"
.LASF35:
	.ascii	"I2C_Start\000"
.LASF23:
	.ascii	"data\000"
.LASF11:
	.ascii	"long long unsigned int\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF32:
	.ascii	"delay_ms\000"
.LASF37:
	.ascii	"I2C_Receive8bit\000"
.LASF21:
	.ascii	"regAddr\000"
.LASF9:
	.ascii	"long unsigned int\000"
.LASF38:
	.ascii	"GNU C 4.9.3 20141119 (release) [ARM/embedded-4_9-br"
	.ascii	"anch revision 218278] -mlittle-endian -mthumb -mcpu"
	.ascii	"=cortex-m4 -mthumb-interwork -mfloat-abi=hard -mfpu"
	.ascii	"=fpv4-sp-d16 -g -O2 -fsingle-precision-constant\000"
.LASF42:
	.ascii	"ITM_RxBuffer\000"
.LASF4:
	.ascii	"__uint16_t\000"
.LASF8:
	.ascii	"__uint32_t\000"
.LASF40:
	.ascii	"/home/amar/msut/STM32F407/MSUT_Zavrsni/MAX30102_I2C"
	.ascii	"\000"
.LASF12:
	.ascii	"unsigned int\000"
.LASF18:
	.ascii	"char\000"
.LASF13:
	.ascii	"uint8_t\000"
.LASF31:
	.ascii	"wr_ptr\000"
.LASF15:
	.ascii	"int32_t\000"
.LASF17:
	.ascii	"sizetype\000"
.LASF30:
	.ascii	"rd_ptr\000"
.LASF39:
	.ascii	"max.c\000"
.LASF26:
	.ascii	"MAX_Init\000"
.LASF29:
	.ascii	"bufferSize\000"
.LASF2:
	.ascii	"short int\000"
.LASF14:
	.ascii	"uint16_t\000"
.LASF41:
	.ascii	"dummy\000"
.LASF19:
	.ascii	"MAX_ReadRegister\000"
.LASF16:
	.ascii	"uint32_t\000"
.LASF7:
	.ascii	"long int\000"
.LASF36:
	.ascii	"I2C_Stop\000"
.LASF0:
	.ascii	"signed char\000"
.LASF33:
	.ascii	"I2C_Send_Addr\000"
.LASF22:
	.ascii	"size\000"
.LASF27:
	.ascii	"MAX_GetFifoSample\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.9.3 20141119 (release) [ARM/embedded-4_9-branch revision 218278]"
