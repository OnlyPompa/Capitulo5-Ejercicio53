	.arch armv6
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"probabilidad.c"
	.text
	.align	2
	.global	jugar_punto
	.arch armv6
	.syntax unified
	.arm
	.fpu vfp
	.type	jugar_punto, %function
jugar_punto:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	vstr.64	d0, [fp, #-12]
	bl	rand
	vmov	s15, r0	@ int
	vcvt.f64.s32	d6, s15
	vldr.64	d7, [fp, #-12]
	vldr.64	d5, .L3
	vmul.f64	d7, d7, d5
	vcmpe.f64	d6, d7
	vmrs	APSR_nzcv, FPSCR
	movmi	r3, #1
	movpl	r3, #0
	uxtb	r3, r3
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L4:
	.align	3
.L3:
	.word	-4194304
	.word	1105199103
	.size	jugar_punto, .-jugar_punto
	.align	2
	.global	jugar_juego
	.syntax unified
	.arm
	.fpu vfp
	.type	jugar_juego, %function
jugar_juego:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	vstr.64	d0, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L6
.L9:
	vldr.64	d0, [fp, #-20]
	bl	jugar_punto
	mov	r3, r0
	cmp	r3, #0
	beq	.L7
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	b	.L6
.L7:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L6:
	ldr	r3, [fp, #-8]
	cmp	r3, #3
	bgt	.L8
	ldr	r3, [fp, #-12]
	cmp	r3, #3
	ble	.L9
.L8:
	ldr	r3, [fp, #-8]
	cmp	r3, #4
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	jugar_juego, .-jugar_juego
	.align	2
	.global	jugar_set
	.syntax unified
	.arm
	.fpu vfp
	.type	jugar_set, %function
jugar_set:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	vstr.64	d0, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L12
.L15:
	vldr.64	d0, [fp, #-20]
	bl	jugar_juego
	mov	r3, r0
	cmp	r3, #0
	beq	.L13
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	b	.L12
.L13:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L12:
	ldr	r3, [fp, #-8]
	cmp	r3, #5
	bgt	.L14
	ldr	r3, [fp, #-12]
	cmp	r3, #5
	ble	.L15
.L14:
	ldr	r3, [fp, #-8]
	cmp	r3, #6
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	jugar_set, .-jugar_set
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Probabilidad de ganar un punto: %.2f, Probabilidad "
	.ascii	"de ganar el partido: %.2f\012\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	mov	r0, #0
	bl	time
	mov	r3, r0
	mov	r0, r3
	bl	srand
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L18
.L22:
	ldr	r3, [fp, #-8]
	vmov	s15, r3	@ int
	vcvt.f64.s32	d6, s15
	vldr.64	d5, .L24
	vdiv.f64	d7, d6, d5
	vstr.64	d7, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L19
.L21:
	vldr.64	d0, [fp, #-28]
	bl	jugar_set
	mov	r3, r0
	cmp	r3, #0
	beq	.L20
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L20:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L19:
	ldr	r3, [fp, #-16]
	cmp	r3, #1000
	blt	.L21
	ldr	r3, [fp, #-12]
	vmov	s15, r3	@ int
	vcvt.f64.s32	d6, s15
	vldr.64	d5, .L24+8
	vdiv.f64	d7, d6, d5
	vstr.64	d7, [sp]
	ldrd	r2, [fp, #-28]
	ldr	r0, .L24+16
	bl	printf
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L18:
	ldr	r3, [fp, #-8]
	cmp	r3, #9
	ble	.L22
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L25:
	.align	3
.L24:
	.word	0
	.word	1076101120
	.word	0
	.word	1083129856
	.word	.LC0
	.size	main, .-main
	.ident	"GCC: (Raspbian 8.3.0-6+rpi1) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
