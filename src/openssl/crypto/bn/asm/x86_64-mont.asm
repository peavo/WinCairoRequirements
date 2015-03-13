default	rel
%define XMMWORD
section	.text code align=64


global	bn_mul_mont

ALIGN	16
bn_mul_mont:
	mov	QWORD[8+rsp],rdi	;WIN64 prologue
	mov	QWORD[16+rsp],rsi
	mov	rax,rsp
$L$SEH_begin_bn_mul_mont:
	mov	rdi,rcx
	mov	rsi,rdx
	mov	rdx,r8
	mov	rcx,r9
	mov	r8,QWORD[40+rsp]
	mov	r9,QWORD[48+rsp]


	test	r9d,3
	jnz	NEAR $L$mul_enter
	cmp	r9d,8
	jb	NEAR $L$mul_enter
	cmp	rdx,rsi
	jne	NEAR $L$mul4x_enter
	jmp	NEAR $L$sqr4x_enter

ALIGN	16
$L$mul_enter:
	push	rbx
	push	rbp
	push	r12
	push	r13
	push	r14
	push	r15

	mov	r9d,r9d
	lea	r10,[2+r9]
	mov	r11,rsp
	neg	r10
	lea	rsp,[r10*8+rsp]
	and	rsp,-1024

	mov	QWORD[8+r9*8+rsp],r11
$L$mul_body:
	mov	r12,rdx
	mov	r8,QWORD[r8]
	mov	rbx,QWORD[r12]
	mov	rax,QWORD[rsi]

	xor	r14,r14
	xor	r15,r15

	mov	rbp,r8
	mul	rbx
	mov	r10,rax
	mov	rax,QWORD[rcx]

	imul	rbp,r10
	mov	r11,rdx

	mul	rbp
	add	r10,rax
	mov	rax,QWORD[8+rsi]
	adc	rdx,0
	mov	r13,rdx

	lea	r15,[1+r15]
	jmp	NEAR $L$1st_enter

ALIGN	16
$L$1st:
	add	r13,rax
	mov	rax,QWORD[r15*8+rsi]
	adc	rdx,0
	add	r13,r11
	mov	r11,r10
	adc	rdx,0
	mov	QWORD[((-16))+r15*8+rsp],r13
	mov	r13,rdx

$L$1st_enter:
	mul	rbx
	add	r11,rax
	mov	rax,QWORD[r15*8+rcx]
	adc	rdx,0
	lea	r15,[1+r15]
	mov	r10,rdx

	mul	rbp
	cmp	r15,r9
	jne	NEAR $L$1st

	add	r13,rax
	mov	rax,QWORD[rsi]
	adc	rdx,0
	add	r13,r11
	adc	rdx,0
	mov	QWORD[((-16))+r15*8+rsp],r13
	mov	r13,rdx
	mov	r11,r10

	xor	rdx,rdx
	add	r13,r11
	adc	rdx,0
	mov	QWORD[((-8))+r9*8+rsp],r13
	mov	QWORD[r9*8+rsp],rdx

	lea	r14,[1+r14]
	jmp	NEAR $L$outer
ALIGN	16
$L$outer:
	mov	rbx,QWORD[r14*8+r12]
	xor	r15,r15
	mov	rbp,r8
	mov	r10,QWORD[rsp]
	mul	rbx
	add	r10,rax
	mov	rax,QWORD[rcx]
	adc	rdx,0

	imul	rbp,r10
	mov	r11,rdx

	mul	rbp
	add	r10,rax
	mov	rax,QWORD[8+rsi]
	adc	rdx,0
	mov	r10,QWORD[8+rsp]
	mov	r13,rdx

	lea	r15,[1+r15]
	jmp	NEAR $L$inner_enter

ALIGN	16
$L$inner:
	add	r13,rax
	mov	rax,QWORD[r15*8+rsi]
	adc	rdx,0
	add	r13,r10
	mov	r10,QWORD[r15*8+rsp]
	adc	rdx,0
	mov	QWORD[((-16))+r15*8+rsp],r13
	mov	r13,rdx

$L$inner_enter:
	mul	rbx
	add	r11,rax
	mov	rax,QWORD[r15*8+rcx]
	adc	rdx,0
	add	r10,r11
	mov	r11,rdx
	adc	r11,0
	lea	r15,[1+r15]

	mul	rbp
	cmp	r15,r9
	jne	NEAR $L$inner

	add	r13,rax
	mov	rax,QWORD[rsi]
	adc	rdx,0
	add	r13,r10
	mov	r10,QWORD[r15*8+rsp]
	adc	rdx,0
	mov	QWORD[((-16))+r15*8+rsp],r13
	mov	r13,rdx

	xor	rdx,rdx
	add	r13,r11
	adc	rdx,0
	add	r13,r10
	adc	rdx,0
	mov	QWORD[((-8))+r9*8+rsp],r13
	mov	QWORD[r9*8+rsp],rdx

	lea	r14,[1+r14]
	cmp	r14,r9
	jl	NEAR $L$outer

	xor	r14,r14
	mov	rax,QWORD[rsp]
	lea	rsi,[rsp]
	mov	r15,r9
	jmp	NEAR $L$sub
ALIGN	16
$L$sub:	sbb	rax,QWORD[r14*8+rcx]
	mov	QWORD[r14*8+rdi],rax
	mov	rax,QWORD[8+r14*8+rsi]
	lea	r14,[1+r14]
	dec	r15
	jnz	NEAR $L$sub

	sbb	rax,0
	xor	r14,r14
	and	rsi,rax
	not	rax
	mov	rcx,rdi
	and	rcx,rax
	mov	r15,r9
	or	rsi,rcx
ALIGN	16
$L$copy:
	mov	rax,QWORD[r14*8+rsi]
	mov	QWORD[r14*8+rsp],r14
	mov	QWORD[r14*8+rdi],rax
	lea	r14,[1+r14]
	sub	r15,1
	jnz	NEAR $L$copy

	mov	rsi,QWORD[8+r9*8+rsp]
	mov	rax,1
	mov	r15,QWORD[rsi]
	mov	r14,QWORD[8+rsi]
	mov	r13,QWORD[16+rsi]
	mov	r12,QWORD[24+rsi]
	mov	rbp,QWORD[32+rsi]
	mov	rbx,QWORD[40+rsi]
	lea	rsp,[48+rsi]
$L$mul_epilogue:
	mov	rdi,QWORD[8+rsp]	;WIN64 epilogue
	mov	rsi,QWORD[16+rsp]
	DB	0F3h,0C3h		;repret
$L$SEH_end_bn_mul_mont:

ALIGN	16
bn_mul4x_mont:
	mov	QWORD[8+rsp],rdi	;WIN64 prologue
	mov	QWORD[16+rsp],rsi
	mov	rax,rsp
$L$SEH_begin_bn_mul4x_mont:
	mov	rdi,rcx
	mov	rsi,rdx
	mov	rdx,r8
	mov	rcx,r9
	mov	r8,QWORD[40+rsp]
	mov	r9,QWORD[48+rsp]


$L$mul4x_enter:
	push	rbx
	push	rbp
	push	r12
	push	r13
	push	r14
	push	r15

	mov	r9d,r9d
	lea	r10,[4+r9]
	mov	r11,rsp
	neg	r10
	lea	rsp,[r10*8+rsp]
	and	rsp,-1024

	mov	QWORD[8+r9*8+rsp],r11
$L$mul4x_body:
	mov	QWORD[16+r9*8+rsp],rdi
	mov	r12,rdx
	mov	r8,QWORD[r8]
	mov	rbx,QWORD[r12]
	mov	rax,QWORD[rsi]

	xor	r14,r14
	xor	r15,r15

	mov	rbp,r8
	mul	rbx
	mov	r10,rax
	mov	rax,QWORD[rcx]

	imul	rbp,r10
	mov	r11,rdx

	mul	rbp
	add	r10,rax
	mov	rax,QWORD[8+rsi]
	adc	rdx,0
	mov	rdi,rdx

	mul	rbx
	add	r11,rax
	mov	rax,QWORD[8+rcx]
	adc	rdx,0
	mov	r10,rdx

	mul	rbp
	add	rdi,rax
	mov	rax,QWORD[16+rsi]
	adc	rdx,0
	add	rdi,r11
	lea	r15,[4+r15]
	adc	rdx,0
	mov	QWORD[rsp],rdi
	mov	r13,rdx
	jmp	NEAR $L$1st4x
ALIGN	16
$L$1st4x:
	mul	rbx
	add	r10,rax
	mov	rax,QWORD[((-16))+r15*8+rcx]
	adc	rdx,0
	mov	r11,rdx

	mul	rbp
	add	r13,rax
	mov	rax,QWORD[((-8))+r15*8+rsi]
	adc	rdx,0
	add	r13,r10
	adc	rdx,0
	mov	QWORD[((-24))+r15*8+rsp],r13
	mov	rdi,rdx

	mul	rbx
	add	r11,rax
	mov	rax,QWORD[((-8))+r15*8+rcx]
	adc	rdx,0
	mov	r10,rdx

	mul	rbp
	add	rdi,rax
	mov	rax,QWORD[r15*8+rsi]
	adc	rdx,0
	add	rdi,r11
	adc	rdx,0
	mov	QWORD[((-16))+r15*8+rsp],rdi
	mov	r13,rdx

	mul	rbx
	add	r10,rax
	mov	rax,QWORD[r15*8+rcx]
	adc	rdx,0
	mov	r11,rdx

	mul	rbp
	add	r13,rax
	mov	rax,QWORD[8+r15*8+rsi]
	adc	rdx,0
	add	r13,r10
	adc	rdx,0
	mov	QWORD[((-8))+r15*8+rsp],r13
	mov	rdi,rdx

	mul	rbx
	add	r11,rax
	mov	rax,QWORD[8+r15*8+rcx]
	adc	rdx,0
	lea	r15,[4+r15]
	mov	r10,rdx

	mul	rbp
	add	rdi,rax
	mov	rax,QWORD[((-16))+r15*8+rsi]
	adc	rdx,0
	add	rdi,r11
	adc	rdx,0
	mov	QWORD[((-32))+r15*8+rsp],rdi
	mov	r13,rdx
	cmp	r15,r9
	jl	NEAR $L$1st4x

	mul	rbx
	add	r10,rax
	mov	rax,QWORD[((-16))+r15*8+rcx]
	adc	rdx,0
	mov	r11,rdx

	mul	rbp
	add	r13,rax
	mov	rax,QWORD[((-8))+r15*8+rsi]
	adc	rdx,0
	add	r13,r10
	adc	rdx,0
	mov	QWORD[((-24))+r15*8+rsp],r13
	mov	rdi,rdx

	mul	rbx
	add	r11,rax
	mov	rax,QWORD[((-8))+r15*8+rcx]
	adc	rdx,0
	mov	r10,rdx

	mul	rbp
	add	rdi,rax
	mov	rax,QWORD[rsi]
	adc	rdx,0
	add	rdi,r11
	adc	rdx,0
	mov	QWORD[((-16))+r15*8+rsp],rdi
	mov	r13,rdx

	xor	rdi,rdi
	add	r13,r10
	adc	rdi,0
	mov	QWORD[((-8))+r15*8+rsp],r13
	mov	QWORD[r15*8+rsp],rdi

	lea	r14,[1+r14]
ALIGN	4
$L$outer4x:
	mov	rbx,QWORD[r14*8+r12]
	xor	r15,r15
	mov	r10,QWORD[rsp]
	mov	rbp,r8
	mul	rbx
	add	r10,rax
	mov	rax,QWORD[rcx]
	adc	rdx,0

	imul	rbp,r10
	mov	r11,rdx

	mul	rbp
	add	r10,rax
	mov	rax,QWORD[8+rsi]
	adc	rdx,0
	mov	rdi,rdx

	mul	rbx
	add	r11,rax
	mov	rax,QWORD[8+rcx]
	adc	rdx,0
	add	r11,QWORD[8+rsp]
	adc	rdx,0
	mov	r10,rdx

	mul	rbp
	add	rdi,rax
	mov	rax,QWORD[16+rsi]
	adc	rdx,0
	add	rdi,r11
	lea	r15,[4+r15]
	adc	rdx,0
	mov	QWORD[rsp],rdi
	mov	r13,rdx
	jmp	NEAR $L$inner4x
ALIGN	16
$L$inner4x:
	mul	rbx
	add	r10,rax
	mov	rax,QWORD[((-16))+r15*8+rcx]
	adc	rdx,0
	add	r10,QWORD[((-16))+r15*8+rsp]
	adc	rdx,0
	mov	r11,rdx

	mul	rbp
	add	r13,rax
	mov	rax,QWORD[((-8))+r15*8+rsi]
	adc	rdx,0
	add	r13,r10
	adc	rdx,0
	mov	QWORD[((-24))+r15*8+rsp],r13
	mov	rdi,rdx

	mul	rbx
	add	r11,rax
	mov	rax,QWORD[((-8))+r15*8+rcx]
	adc	rdx,0
	add	r11,QWORD[((-8))+r15*8+rsp]
	adc	rdx,0
	mov	r10,rdx

	mul	rbp
	add	rdi,rax
	mov	rax,QWORD[r15*8+rsi]
	adc	rdx,0
	add	rdi,r11
	adc	rdx,0
	mov	QWORD[((-16))+r15*8+rsp],rdi
	mov	r13,rdx

	mul	rbx
	add	r10,rax
	mov	rax,QWORD[r15*8+rcx]
	adc	rdx,0
	add	r10,QWORD[r15*8+rsp]
	adc	rdx,0
	mov	r11,rdx

	mul	rbp
	add	r13,rax
	mov	rax,QWORD[8+r15*8+rsi]
	adc	rdx,0
	add	r13,r10
	adc	rdx,0
	mov	QWORD[((-8))+r15*8+rsp],r13
	mov	rdi,rdx

	mul	rbx
	add	r11,rax
	mov	rax,QWORD[8+r15*8+rcx]
	adc	rdx,0
	add	r11,QWORD[8+r15*8+rsp]
	adc	rdx,0
	lea	r15,[4+r15]
	mov	r10,rdx

	mul	rbp
	add	rdi,rax
	mov	rax,QWORD[((-16))+r15*8+rsi]
	adc	rdx,0
	add	rdi,r11
	adc	rdx,0
	mov	QWORD[((-32))+r15*8+rsp],rdi
	mov	r13,rdx
	cmp	r15,r9
	jl	NEAR $L$inner4x

	mul	rbx
	add	r10,rax
	mov	rax,QWORD[((-16))+r15*8+rcx]
	adc	rdx,0
	add	r10,QWORD[((-16))+r15*8+rsp]
	adc	rdx,0
	mov	r11,rdx

	mul	rbp
	add	r13,rax
	mov	rax,QWORD[((-8))+r15*8+rsi]
	adc	rdx,0
	add	r13,r10
	adc	rdx,0
	mov	QWORD[((-24))+r15*8+rsp],r13
	mov	rdi,rdx

	mul	rbx
	add	r11,rax
	mov	rax,QWORD[((-8))+r15*8+rcx]
	adc	rdx,0
	add	r11,QWORD[((-8))+r15*8+rsp]
	adc	rdx,0
	lea	r14,[1+r14]
	mov	r10,rdx

	mul	rbp
	add	rdi,rax
	mov	rax,QWORD[rsi]
	adc	rdx,0
	add	rdi,r11
	adc	rdx,0
	mov	QWORD[((-16))+r15*8+rsp],rdi
	mov	r13,rdx

	xor	rdi,rdi
	add	r13,r10
	adc	rdi,0
	add	r13,QWORD[r9*8+rsp]
	adc	rdi,0
	mov	QWORD[((-8))+r15*8+rsp],r13
	mov	QWORD[r15*8+rsp],rdi

	cmp	r14,r9
	jl	NEAR $L$outer4x
	mov	rdi,QWORD[16+r9*8+rsp]
	mov	rax,QWORD[rsp]
	pxor	xmm0,xmm0
	mov	rdx,QWORD[8+rsp]
	shr	r9,2
	lea	rsi,[rsp]
	xor	r14,r14

	sub	rax,QWORD[rcx]
	mov	rbx,QWORD[16+rsi]
	mov	rbp,QWORD[24+rsi]
	sbb	rdx,QWORD[8+rcx]
	lea	r15,[((-1))+r9]
	jmp	NEAR $L$sub4x
ALIGN	16
$L$sub4x:
	mov	QWORD[r14*8+rdi],rax
	mov	QWORD[8+r14*8+rdi],rdx
	sbb	rbx,QWORD[16+r14*8+rcx]
	mov	rax,QWORD[32+r14*8+rsi]
	mov	rdx,QWORD[40+r14*8+rsi]
	sbb	rbp,QWORD[24+r14*8+rcx]
	mov	QWORD[16+r14*8+rdi],rbx
	mov	QWORD[24+r14*8+rdi],rbp
	sbb	rax,QWORD[32+r14*8+rcx]
	mov	rbx,QWORD[48+r14*8+rsi]
	mov	rbp,QWORD[56+r14*8+rsi]
	sbb	rdx,QWORD[40+r14*8+rcx]
	lea	r14,[4+r14]
	dec	r15
	jnz	NEAR $L$sub4x

	mov	QWORD[r14*8+rdi],rax
	mov	rax,QWORD[32+r14*8+rsi]
	sbb	rbx,QWORD[16+r14*8+rcx]
	mov	QWORD[8+r14*8+rdi],rdx
	sbb	rbp,QWORD[24+r14*8+rcx]
	mov	QWORD[16+r14*8+rdi],rbx

	sbb	rax,0
	mov	QWORD[24+r14*8+rdi],rbp
	xor	r14,r14
	and	rsi,rax
	not	rax
	mov	rcx,rdi
	and	rcx,rax
	lea	r15,[((-1))+r9]
	or	rsi,rcx

	movdqu	xmm1,XMMWORD[rsi]
	movdqa	XMMWORD[rsp],xmm0
	movdqu	XMMWORD[rdi],xmm1
	jmp	NEAR $L$copy4x
ALIGN	16
$L$copy4x:
	movdqu	xmm2,XMMWORD[16+r14*1+rsi]
	movdqu	xmm1,XMMWORD[32+r14*1+rsi]
	movdqa	XMMWORD[16+r14*1+rsp],xmm0
	movdqu	XMMWORD[16+r14*1+rdi],xmm2
	movdqa	XMMWORD[32+r14*1+rsp],xmm0
	movdqu	XMMWORD[32+r14*1+rdi],xmm1
	lea	r14,[32+r14]
	dec	r15
	jnz	NEAR $L$copy4x

	shl	r9,2
	movdqu	xmm2,XMMWORD[16+r14*1+rsi]
	movdqa	XMMWORD[16+r14*1+rsp],xmm0
	movdqu	XMMWORD[16+r14*1+rdi],xmm2
	mov	rsi,QWORD[8+r9*8+rsp]
	mov	rax,1
	mov	r15,QWORD[rsi]
	mov	r14,QWORD[8+rsi]
	mov	r13,QWORD[16+rsi]
	mov	r12,QWORD[24+rsi]
	mov	rbp,QWORD[32+rsi]
	mov	rbx,QWORD[40+rsi]
	lea	rsp,[48+rsi]
$L$mul4x_epilogue:
	mov	rdi,QWORD[8+rsp]	;WIN64 epilogue
	mov	rsi,QWORD[16+rsp]
	DB	0F3h,0C3h		;repret
$L$SEH_end_bn_mul4x_mont:

ALIGN	16
bn_sqr4x_mont:
	mov	QWORD[8+rsp],rdi	;WIN64 prologue
	mov	QWORD[16+rsp],rsi
	mov	rax,rsp
$L$SEH_begin_bn_sqr4x_mont:
	mov	rdi,rcx
	mov	rsi,rdx
	mov	rdx,r8
	mov	rcx,r9
	mov	r8,QWORD[40+rsp]
	mov	r9,QWORD[48+rsp]


$L$sqr4x_enter:
	push	rbx
	push	rbp
	push	r12
	push	r13
	push	r14
	push	r15

	shl	r9d,3
	xor	r10,r10
	mov	r11,rsp
	sub	r10,r9
	mov	r8,QWORD[r8]
	lea	rsp,[((-72))+r10*2+rsp]
	and	rsp,-1024











	mov	QWORD[32+rsp],rdi
	mov	QWORD[40+rsp],rcx
	mov	QWORD[48+rsp],r8
	mov	QWORD[56+rsp],r11
$L$sqr4x_body:







	lea	rbp,[32+r10]
	lea	rsi,[r9*1+rsi]

	mov	rcx,r9


	mov	r14,QWORD[((-32))+rbp*1+rsi]
	lea	rdi,[64+r9*2+rsp]
	mov	rax,QWORD[((-24))+rbp*1+rsi]
	lea	rdi,[((-32))+rbp*1+rdi]
	mov	rbx,QWORD[((-16))+rbp*1+rsi]
	mov	r15,rax

	mul	r14
	mov	r10,rax
	mov	rax,rbx
	mov	r11,rdx
	mov	QWORD[((-24))+rbp*1+rdi],r10

	xor	r10,r10
	mul	r14
	add	r11,rax
	mov	rax,rbx
	adc	r10,rdx
	mov	QWORD[((-16))+rbp*1+rdi],r11

	lea	rcx,[((-16))+rbp]


	mov	rbx,QWORD[8+rcx*1+rsi]
	mul	r15
	mov	r12,rax
	mov	rax,rbx
	mov	r13,rdx

	xor	r11,r11
	add	r10,r12
	lea	rcx,[16+rcx]
	adc	r11,0
	mul	r14
	add	r10,rax
	mov	rax,rbx
	adc	r11,rdx
	mov	QWORD[((-8))+rcx*1+rdi],r10
	jmp	NEAR $L$sqr4x_1st

ALIGN	16
$L$sqr4x_1st:
	mov	rbx,QWORD[rcx*1+rsi]
	xor	r12,r12
	mul	r15
	add	r13,rax
	mov	rax,rbx
	adc	r12,rdx

	xor	r10,r10
	add	r11,r13
	adc	r10,0
	mul	r14
	add	r11,rax
	mov	rax,rbx
	adc	r10,rdx
	mov	QWORD[rcx*1+rdi],r11


	mov	rbx,QWORD[8+rcx*1+rsi]
	xor	r13,r13
	mul	r15
	add	r12,rax
	mov	rax,rbx
	adc	r13,rdx

	xor	r11,r11
	add	r10,r12
	adc	r11,0
	mul	r14
	add	r10,rax
	mov	rax,rbx
	adc	r11,rdx
	mov	QWORD[8+rcx*1+rdi],r10

	mov	rbx,QWORD[16+rcx*1+rsi]
	xor	r12,r12
	mul	r15
	add	r13,rax
	mov	rax,rbx
	adc	r12,rdx

	xor	r10,r10
	add	r11,r13
	adc	r10,0
	mul	r14
	add	r11,rax
	mov	rax,rbx
	adc	r10,rdx
	mov	QWORD[16+rcx*1+rdi],r11


	mov	rbx,QWORD[24+rcx*1+rsi]
	xor	r13,r13
	mul	r15
	add	r12,rax
	mov	rax,rbx
	adc	r13,rdx

	xor	r11,r11
	add	r10,r12
	lea	rcx,[32+rcx]
	adc	r11,0
	mul	r14
	add	r10,rax
	mov	rax,rbx
	adc	r11,rdx
	mov	QWORD[((-8))+rcx*1+rdi],r10

	cmp	rcx,0
	jne	NEAR $L$sqr4x_1st

	xor	r12,r12
	add	r13,r11
	adc	r12,0
	mul	r15
	add	r13,rax
	adc	r12,rdx

	mov	QWORD[rdi],r13
	lea	rbp,[16+rbp]
	mov	QWORD[8+rdi],r12
	jmp	NEAR $L$sqr4x_outer

ALIGN	16
$L$sqr4x_outer:
	mov	r14,QWORD[((-32))+rbp*1+rsi]
	lea	rdi,[64+r9*2+rsp]
	mov	rax,QWORD[((-24))+rbp*1+rsi]
	lea	rdi,[((-32))+rbp*1+rdi]
	mov	rbx,QWORD[((-16))+rbp*1+rsi]
	mov	r15,rax

	mov	r10,QWORD[((-24))+rbp*1+rdi]
	xor	r11,r11
	mul	r14
	add	r10,rax
	mov	rax,rbx
	adc	r11,rdx
	mov	QWORD[((-24))+rbp*1+rdi],r10

	xor	r10,r10
	add	r11,QWORD[((-16))+rbp*1+rdi]
	adc	r10,0
	mul	r14
	add	r11,rax
	mov	rax,rbx
	adc	r10,rdx
	mov	QWORD[((-16))+rbp*1+rdi],r11

	lea	rcx,[((-16))+rbp]
	xor	r12,r12


	mov	rbx,QWORD[8+rcx*1+rsi]
	xor	r13,r13
	add	r12,QWORD[8+rcx*1+rdi]
	adc	r13,0
	mul	r15
	add	r12,rax
	mov	rax,rbx
	adc	r13,rdx

	xor	r11,r11
	add	r10,r12
	adc	r11,0
	mul	r14
	add	r10,rax
	mov	rax,rbx
	adc	r11,rdx
	mov	QWORD[8+rcx*1+rdi],r10

	lea	rcx,[16+rcx]
	jmp	NEAR $L$sqr4x_inner

ALIGN	16
$L$sqr4x_inner:
	mov	rbx,QWORD[rcx*1+rsi]
	xor	r12,r12
	add	r13,QWORD[rcx*1+rdi]
	adc	r12,0
	mul	r15
	add	r13,rax
	mov	rax,rbx
	adc	r12,rdx

	xor	r10,r10
	add	r11,r13
	adc	r10,0
	mul	r14
	add	r11,rax
	mov	rax,rbx
	adc	r10,rdx
	mov	QWORD[rcx*1+rdi],r11

	mov	rbx,QWORD[8+rcx*1+rsi]
	xor	r13,r13
	add	r12,QWORD[8+rcx*1+rdi]
	adc	r13,0
	mul	r15
	add	r12,rax
	mov	rax,rbx
	adc	r13,rdx

	xor	r11,r11
	add	r10,r12
	lea	rcx,[16+rcx]
	adc	r11,0
	mul	r14
	add	r10,rax
	mov	rax,rbx
	adc	r11,rdx
	mov	QWORD[((-8))+rcx*1+rdi],r10

	cmp	rcx,0
	jne	NEAR $L$sqr4x_inner

	xor	r12,r12
	add	r13,r11
	adc	r12,0
	mul	r15
	add	r13,rax
	adc	r12,rdx

	mov	QWORD[rdi],r13
	mov	QWORD[8+rdi],r12

	add	rbp,16
	jnz	NEAR $L$sqr4x_outer


	mov	r14,QWORD[((-32))+rsi]
	lea	rdi,[64+r9*2+rsp]
	mov	rax,QWORD[((-24))+rsi]
	lea	rdi,[((-32))+rbp*1+rdi]
	mov	rbx,QWORD[((-16))+rsi]
	mov	r15,rax

	xor	r11,r11
	mul	r14
	add	r10,rax
	mov	rax,rbx
	adc	r11,rdx
	mov	QWORD[((-24))+rdi],r10

	xor	r10,r10
	add	r11,r13
	adc	r10,0
	mul	r14
	add	r11,rax
	mov	rax,rbx
	adc	r10,rdx
	mov	QWORD[((-16))+rdi],r11

	mov	rbx,QWORD[((-8))+rsi]
	mul	r15
	add	r12,rax
	mov	rax,rbx
	adc	rdx,0

	xor	r11,r11
	add	r10,r12
	mov	r13,rdx
	adc	r11,0
	mul	r14
	add	r10,rax
	mov	rax,rbx
	adc	r11,rdx
	mov	QWORD[((-8))+rdi],r10

	xor	r12,r12
	add	r13,r11
	adc	r12,0
	mul	r15
	add	r13,rax
	mov	rax,QWORD[((-16))+rsi]
	adc	r12,rdx

	mov	QWORD[rdi],r13
	mov	QWORD[8+rdi],r12

	mul	rbx
	add	rbp,16
	xor	r14,r14
	sub	rbp,r9
	xor	r15,r15

	add	rax,r12
	adc	rdx,0
	mov	QWORD[8+rdi],rax
	mov	QWORD[16+rdi],rdx
	mov	QWORD[24+rdi],r15

	mov	rax,QWORD[((-16))+rbp*1+rsi]
	lea	rdi,[64+r9*2+rsp]
	xor	r10,r10
	mov	r11,QWORD[((-24))+rbp*2+rdi]

	lea	r12,[r10*2+r14]
	shr	r10,63
	lea	r13,[r11*2+rcx]
	shr	r11,63
	or	r13,r10
	mov	r10,QWORD[((-16))+rbp*2+rdi]
	mov	r14,r11
	mul	rax
	neg	r15
	mov	r11,QWORD[((-8))+rbp*2+rdi]
	adc	r12,rax
	mov	rax,QWORD[((-8))+rbp*1+rsi]
	mov	QWORD[((-32))+rbp*2+rdi],r12
	adc	r13,rdx

	lea	rbx,[r10*2+r14]
	mov	QWORD[((-24))+rbp*2+rdi],r13
	sbb	r15,r15
	shr	r10,63
	lea	r8,[r11*2+rcx]
	shr	r11,63
	or	r8,r10
	mov	r10,QWORD[rbp*2+rdi]
	mov	r14,r11
	mul	rax
	neg	r15
	mov	r11,QWORD[8+rbp*2+rdi]
	adc	rbx,rax
	mov	rax,QWORD[rbp*1+rsi]
	mov	QWORD[((-16))+rbp*2+rdi],rbx
	adc	r8,rdx
	lea	rbp,[16+rbp]
	mov	QWORD[((-40))+rbp*2+rdi],r8
	sbb	r15,r15
	jmp	NEAR $L$sqr4x_shift_n_add

ALIGN	16
$L$sqr4x_shift_n_add:
	lea	r12,[r10*2+r14]
	shr	r10,63
	lea	r13,[r11*2+rcx]
	shr	r11,63
	or	r13,r10
	mov	r10,QWORD[((-16))+rbp*2+rdi]
	mov	r14,r11
	mul	rax
	neg	r15
	mov	r11,QWORD[((-8))+rbp*2+rdi]
	adc	r12,rax
	mov	rax,QWORD[((-8))+rbp*1+rsi]
	mov	QWORD[((-32))+rbp*2+rdi],r12
	adc	r13,rdx

	lea	rbx,[r10*2+r14]
	mov	QWORD[((-24))+rbp*2+rdi],r13
	sbb	r15,r15
	shr	r10,63
	lea	r8,[r11*2+rcx]
	shr	r11,63
	or	r8,r10
	mov	r10,QWORD[rbp*2+rdi]
	mov	r14,r11
	mul	rax
	neg	r15
	mov	r11,QWORD[8+rbp*2+rdi]
	adc	rbx,rax
	mov	rax,QWORD[rbp*1+rsi]
	mov	QWORD[((-16))+rbp*2+rdi],rbx
	adc	r8,rdx

	lea	r12,[r10*2+r14]
	mov	QWORD[((-8))+rbp*2+rdi],r8
	sbb	r15,r15
	shr	r10,63
	lea	r13,[r11*2+rcx]
	shr	r11,63
	or	r13,r10
	mov	r10,QWORD[16+rbp*2+rdi]
	mov	r14,r11
	mul	rax
	neg	r15
	mov	r11,QWORD[24+rbp*2+rdi]
	adc	r12,rax
	mov	rax,QWORD[8+rbp*1+rsi]
	mov	QWORD[rbp*2+rdi],r12
	adc	r13,rdx

	lea	rbx,[r10*2+r14]
	mov	QWORD[8+rbp*2+rdi],r13
	sbb	r15,r15
	shr	r10,63
	lea	r8,[r11*2+rcx]
	shr	r11,63
	or	r8,r10
	mov	r10,QWORD[32+rbp*2+rdi]
	mov	r14,r11
	mul	rax
	neg	r15
	mov	r11,QWORD[40+rbp*2+rdi]
	adc	rbx,rax
	mov	rax,QWORD[16+rbp*1+rsi]
	mov	QWORD[16+rbp*2+rdi],rbx
	adc	r8,rdx
	mov	QWORD[24+rbp*2+rdi],r8
	sbb	r15,r15
	add	rbp,32
	jnz	NEAR $L$sqr4x_shift_n_add

	lea	r12,[r10*2+r14]
	shr	r10,63
	lea	r13,[r11*2+rcx]
	shr	r11,63
	or	r13,r10
	mov	r10,QWORD[((-16))+rdi]
	mov	r14,r11
	mul	rax
	neg	r15
	mov	r11,QWORD[((-8))+rdi]
	adc	r12,rax
	mov	rax,QWORD[((-8))+rsi]
	mov	QWORD[((-32))+rdi],r12
	adc	r13,rdx

	lea	rbx,[r10*2+r14]
	mov	QWORD[((-24))+rdi],r13
	sbb	r15,r15
	shr	r10,63
	lea	r8,[r11*2+rcx]
	shr	r11,63
	or	r8,r10
	mul	rax
	neg	r15
	adc	rbx,rax
	adc	r8,rdx
	mov	QWORD[((-16))+rdi],rbx
	mov	QWORD[((-8))+rdi],r8
	mov	rsi,QWORD[40+rsp]
	mov	r8,QWORD[48+rsp]
	xor	rcx,rcx
	mov	QWORD[rsp],r9
	sub	rcx,r9
	mov	r10,QWORD[64+rsp]
	mov	r14,r8
	lea	rax,[64+r9*2+rsp]
	lea	rdi,[64+r9*1+rsp]
	mov	QWORD[8+rsp],rax
	lea	rsi,[r9*1+rsi]
	xor	rbp,rbp

	mov	rax,QWORD[rcx*1+rsi]
	mov	r9,QWORD[8+rcx*1+rsi]
	imul	r14,r10
	mov	rbx,rax
	jmp	NEAR $L$sqr4x_mont_outer

ALIGN	16
$L$sqr4x_mont_outer:
	xor	r11,r11
	mul	r14
	add	r10,rax
	mov	rax,r9
	adc	r11,rdx
	mov	r15,r8

	xor	r10,r10
	add	r11,QWORD[8+rcx*1+rdi]
	adc	r10,0
	mul	r14
	add	r11,rax
	mov	rax,rbx
	adc	r10,rdx

	imul	r15,r11

	mov	rbx,QWORD[16+rcx*1+rsi]
	xor	r13,r13
	add	r12,r11
	adc	r13,0
	mul	r15
	add	r12,rax
	mov	rax,rbx
	adc	r13,rdx
	mov	QWORD[8+rcx*1+rdi],r12

	xor	r11,r11
	add	r10,QWORD[16+rcx*1+rdi]
	adc	r11,0
	mul	r14
	add	r10,rax
	mov	rax,r9
	adc	r11,rdx

	mov	r9,QWORD[24+rcx*1+rsi]
	xor	r12,r12
	add	r13,r10
	adc	r12,0
	mul	r15
	add	r13,rax
	mov	rax,r9
	adc	r12,rdx
	mov	QWORD[16+rcx*1+rdi],r13

	xor	r10,r10
	add	r11,QWORD[24+rcx*1+rdi]
	lea	rcx,[32+rcx]
	adc	r10,0
	mul	r14
	add	r11,rax
	mov	rax,rbx
	adc	r10,rdx
	jmp	NEAR $L$sqr4x_mont_inner

ALIGN	16
$L$sqr4x_mont_inner:
	mov	rbx,QWORD[rcx*1+rsi]
	xor	r13,r13
	add	r12,r11
	adc	r13,0
	mul	r15
	add	r12,rax
	mov	rax,rbx
	adc	r13,rdx
	mov	QWORD[((-8))+rcx*1+rdi],r12

	xor	r11,r11
	add	r10,QWORD[rcx*1+rdi]
	adc	r11,0
	mul	r14
	add	r10,rax
	mov	rax,r9
	adc	r11,rdx

	mov	r9,QWORD[8+rcx*1+rsi]
	xor	r12,r12
	add	r13,r10
	adc	r12,0
	mul	r15
	add	r13,rax
	mov	rax,r9
	adc	r12,rdx
	mov	QWORD[rcx*1+rdi],r13

	xor	r10,r10
	add	r11,QWORD[8+rcx*1+rdi]
	adc	r10,0
	mul	r14
	add	r11,rax
	mov	rax,rbx
	adc	r10,rdx


	mov	rbx,QWORD[16+rcx*1+rsi]
	xor	r13,r13
	add	r12,r11
	adc	r13,0
	mul	r15
	add	r12,rax
	mov	rax,rbx
	adc	r13,rdx
	mov	QWORD[8+rcx*1+rdi],r12

	xor	r11,r11
	add	r10,QWORD[16+rcx*1+rdi]
	adc	r11,0
	mul	r14
	add	r10,rax
	mov	rax,r9
	adc	r11,rdx

	mov	r9,QWORD[24+rcx*1+rsi]
	xor	r12,r12
	add	r13,r10
	adc	r12,0
	mul	r15
	add	r13,rax
	mov	rax,r9
	adc	r12,rdx
	mov	QWORD[16+rcx*1+rdi],r13

	xor	r10,r10
	add	r11,QWORD[24+rcx*1+rdi]
	lea	rcx,[32+rcx]
	adc	r10,0
	mul	r14
	add	r11,rax
	mov	rax,rbx
	adc	r10,rdx
	cmp	rcx,0
	jne	NEAR $L$sqr4x_mont_inner

	sub	rcx,QWORD[rsp]
	mov	r14,r8

	xor	r13,r13
	add	r12,r11
	adc	r13,0
	mul	r15
	add	r12,rax
	mov	rax,r9
	adc	r13,rdx
	mov	QWORD[((-8))+rdi],r12

	xor	r11,r11
	add	r10,QWORD[rdi]
	adc	r11,0
	mov	rbx,QWORD[rcx*1+rsi]
	add	r10,rbp
	adc	r11,0

	imul	r14,QWORD[16+rcx*1+rdi]
	xor	r12,r12
	mov	r9,QWORD[8+rcx*1+rsi]
	add	r13,r10
	mov	r10,QWORD[16+rcx*1+rdi]
	adc	r12,0
	mul	r15
	add	r13,rax
	mov	rax,rbx
	adc	r12,rdx
	mov	QWORD[rdi],r13

	xor	rbp,rbp
	add	r12,QWORD[8+rdi]
	adc	rbp,rbp
	add	r12,r11
	lea	rdi,[16+rdi]
	adc	rbp,0
	mov	QWORD[((-8))+rdi],r12
	cmp	rdi,QWORD[8+rsp]
	jb	NEAR $L$sqr4x_mont_outer

	mov	r9,QWORD[rsp]
	mov	QWORD[rdi],rbp
	mov	rax,QWORD[64+r9*1+rsp]
	lea	rbx,[64+r9*1+rsp]
	mov	rsi,QWORD[40+rsp]
	shr	r9,5
	mov	rdx,QWORD[8+rbx]
	xor	rbp,rbp

	mov	rdi,QWORD[32+rsp]
	sub	rax,QWORD[rsi]
	mov	r10,QWORD[16+rbx]
	mov	r11,QWORD[24+rbx]
	sbb	rdx,QWORD[8+rsi]
	lea	rcx,[((-1))+r9]
	jmp	NEAR $L$sqr4x_sub
ALIGN	16
$L$sqr4x_sub:
	mov	QWORD[rbp*8+rdi],rax
	mov	QWORD[8+rbp*8+rdi],rdx
	sbb	r10,QWORD[16+rbp*8+rsi]
	mov	rax,QWORD[32+rbp*8+rbx]
	mov	rdx,QWORD[40+rbp*8+rbx]
	sbb	r11,QWORD[24+rbp*8+rsi]
	mov	QWORD[16+rbp*8+rdi],r10
	mov	QWORD[24+rbp*8+rdi],r11
	sbb	rax,QWORD[32+rbp*8+rsi]
	mov	r10,QWORD[48+rbp*8+rbx]
	mov	r11,QWORD[56+rbp*8+rbx]
	sbb	rdx,QWORD[40+rbp*8+rsi]
	lea	rbp,[4+rbp]
	dec	rcx
	jnz	NEAR $L$sqr4x_sub

	mov	QWORD[rbp*8+rdi],rax
	mov	rax,QWORD[32+rbp*8+rbx]
	sbb	r10,QWORD[16+rbp*8+rsi]
	mov	QWORD[8+rbp*8+rdi],rdx
	sbb	r11,QWORD[24+rbp*8+rsi]
	mov	QWORD[16+rbp*8+rdi],r10

	sbb	rax,0
	mov	QWORD[24+rbp*8+rdi],r11
	xor	rbp,rbp
	and	rbx,rax
	not	rax
	mov	rsi,rdi
	and	rsi,rax
	lea	rcx,[((-1))+r9]
	or	rbx,rsi

	pxor	xmm0,xmm0
	lea	rsi,[64+r9*8+rsp]
	movdqu	xmm1,XMMWORD[rbx]
	lea	rsi,[r9*8+rsi]
	movdqa	XMMWORD[64+rsp],xmm0
	movdqa	XMMWORD[rsi],xmm0
	movdqu	XMMWORD[rdi],xmm1
	jmp	NEAR $L$sqr4x_copy
ALIGN	16
$L$sqr4x_copy:
	movdqu	xmm2,XMMWORD[16+rbp*1+rbx]
	movdqu	xmm1,XMMWORD[32+rbp*1+rbx]
	movdqa	XMMWORD[80+rbp*1+rsp],xmm0
	movdqa	XMMWORD[96+rbp*1+rsp],xmm0
	movdqa	XMMWORD[16+rbp*1+rsi],xmm0
	movdqa	XMMWORD[32+rbp*1+rsi],xmm0
	movdqu	XMMWORD[16+rbp*1+rdi],xmm2
	movdqu	XMMWORD[32+rbp*1+rdi],xmm1
	lea	rbp,[32+rbp]
	dec	rcx
	jnz	NEAR $L$sqr4x_copy

	movdqu	xmm2,XMMWORD[16+rbp*1+rbx]
	movdqa	XMMWORD[80+rbp*1+rsp],xmm0
	movdqa	XMMWORD[16+rbp*1+rsi],xmm0
	movdqu	XMMWORD[16+rbp*1+rdi],xmm2
	mov	rsi,QWORD[56+rsp]
	mov	rax,1
	mov	r15,QWORD[rsi]
	mov	r14,QWORD[8+rsi]
	mov	r13,QWORD[16+rsi]
	mov	r12,QWORD[24+rsi]
	mov	rbp,QWORD[32+rsi]
	mov	rbx,QWORD[40+rsi]
	lea	rsp,[48+rsi]
$L$sqr4x_epilogue:
	mov	rdi,QWORD[8+rsp]	;WIN64 epilogue
	mov	rsi,QWORD[16+rsp]
	DB	0F3h,0C3h		;repret
$L$SEH_end_bn_sqr4x_mont:
DB	77,111,110,116,103,111,109,101,114,121,32,77,117,108,116,105
DB	112,108,105,99,97,116,105,111,110,32,102,111,114,32,120,56
DB	54,95,54,52,44,32,67,82,89,80,84,79,71,65,77,83
DB	32,98,121,32,60,97,112,112,114,111,64,111,112,101,110,115
DB	115,108,46,111,114,103,62,0
ALIGN	16
EXTERN	__imp_RtlVirtualUnwind

ALIGN	16
mul_handler:
	push	rsi
	push	rdi
	push	rbx
	push	rbp
	push	r12
	push	r13
	push	r14
	push	r15
	pushfq
	sub	rsp,64

	mov	rax,QWORD[120+r8]
	mov	rbx,QWORD[248+r8]

	mov	rsi,QWORD[8+r9]
	mov	r11,QWORD[56+r9]

	mov	r10d,DWORD[r11]
	lea	r10,[r10*1+rsi]
	cmp	rbx,r10
	jb	NEAR $L$common_seh_tail

	mov	rax,QWORD[152+r8]

	mov	r10d,DWORD[4+r11]
	lea	r10,[r10*1+rsi]
	cmp	rbx,r10
	jae	NEAR $L$common_seh_tail

	mov	r10,QWORD[192+r8]
	mov	rax,QWORD[8+r10*8+rax]
	lea	rax,[48+rax]

	mov	rbx,QWORD[((-8))+rax]
	mov	rbp,QWORD[((-16))+rax]
	mov	r12,QWORD[((-24))+rax]
	mov	r13,QWORD[((-32))+rax]
	mov	r14,QWORD[((-40))+rax]
	mov	r15,QWORD[((-48))+rax]
	mov	QWORD[144+r8],rbx
	mov	QWORD[160+r8],rbp
	mov	QWORD[216+r8],r12
	mov	QWORD[224+r8],r13
	mov	QWORD[232+r8],r14
	mov	QWORD[240+r8],r15

	jmp	NEAR $L$common_seh_tail



ALIGN	16
sqr_handler:
	push	rsi
	push	rdi
	push	rbx
	push	rbp
	push	r12
	push	r13
	push	r14
	push	r15
	pushfq
	sub	rsp,64

	mov	rax,QWORD[120+r8]
	mov	rbx,QWORD[248+r8]

	lea	r10,[$L$sqr4x_body]
	cmp	rbx,r10
	jb	NEAR $L$common_seh_tail

	mov	rax,QWORD[152+r8]

	lea	r10,[$L$sqr4x_epilogue]
	cmp	rbx,r10
	jae	NEAR $L$common_seh_tail

	mov	rax,QWORD[56+rax]
	lea	rax,[48+rax]

	mov	rbx,QWORD[((-8))+rax]
	mov	rbp,QWORD[((-16))+rax]
	mov	r12,QWORD[((-24))+rax]
	mov	r13,QWORD[((-32))+rax]
	mov	r14,QWORD[((-40))+rax]
	mov	r15,QWORD[((-48))+rax]
	mov	QWORD[144+r8],rbx
	mov	QWORD[160+r8],rbp
	mov	QWORD[216+r8],r12
	mov	QWORD[224+r8],r13
	mov	QWORD[232+r8],r14
	mov	QWORD[240+r8],r15

$L$common_seh_tail:
	mov	rdi,QWORD[8+rax]
	mov	rsi,QWORD[16+rax]
	mov	QWORD[152+r8],rax
	mov	QWORD[168+r8],rsi
	mov	QWORD[176+r8],rdi

	mov	rdi,QWORD[40+r9]
	mov	rsi,r8
	mov	ecx,154
	DD	0xa548f3fc		

	mov	rsi,r9
	xor	rcx,rcx
	mov	rdx,QWORD[8+rsi]
	mov	r8,QWORD[rsi]
	mov	r9,QWORD[16+rsi]
	mov	r10,QWORD[40+rsi]
	lea	r11,[56+rsi]
	lea	r12,[24+rsi]
	mov	QWORD[32+rsp],r10
	mov	QWORD[40+rsp],r11
	mov	QWORD[48+rsp],r12
	mov	QWORD[56+rsp],rcx
	call	QWORD[__imp_RtlVirtualUnwind]

	mov	eax,1
	add	rsp,64
	popfq
	pop	r15
	pop	r14
	pop	r13
	pop	r12
	pop	rbp
	pop	rbx
	pop	rdi
	pop	rsi
	DB	0F3h,0C3h		;repret


section	.pdata rdata align=4
ALIGN	4
	DD	$L$SEH_begin_bn_mul_mont wrt ..imagebase
	DD	$L$SEH_end_bn_mul_mont wrt ..imagebase
	DD	$L$SEH_info_bn_mul_mont wrt ..imagebase

	DD	$L$SEH_begin_bn_mul4x_mont wrt ..imagebase
	DD	$L$SEH_end_bn_mul4x_mont wrt ..imagebase
	DD	$L$SEH_info_bn_mul4x_mont wrt ..imagebase

	DD	$L$SEH_begin_bn_sqr4x_mont wrt ..imagebase
	DD	$L$SEH_end_bn_sqr4x_mont wrt ..imagebase
	DD	$L$SEH_info_bn_sqr4x_mont wrt ..imagebase

section	.xdata rdata align=8
ALIGN	8
$L$SEH_info_bn_mul_mont:
DB	9,0,0,0
	DD	mul_handler wrt ..imagebase
	DD	$L$mul_body wrt ..imagebase,$L$mul_epilogue wrt ..imagebase	
$L$SEH_info_bn_mul4x_mont:
DB	9,0,0,0
	DD	mul_handler wrt ..imagebase
	DD	$L$mul4x_body wrt ..imagebase,$L$mul4x_epilogue wrt ..imagebase	
$L$SEH_info_bn_sqr4x_mont:
DB	9,0,0,0
	DD	sqr_handler wrt ..imagebase
