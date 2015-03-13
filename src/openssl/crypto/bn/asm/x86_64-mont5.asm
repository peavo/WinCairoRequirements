default	rel
%define XMMWORD
section	.text code align=64


global	bn_mul_mont_gather5

ALIGN	64
bn_mul_mont_gather5:
	mov	QWORD[8+rsp],rdi	;WIN64 prologue
	mov	QWORD[16+rsp],rsi
	mov	rax,rsp
$L$SEH_begin_bn_mul_mont_gather5:
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
	jmp	NEAR $L$mul4x_enter

ALIGN	16
$L$mul_enter:
	mov	r9d,r9d
	mov	r10d,DWORD[56+rsp]
	push	rbx
	push	rbp
	push	r12
	push	r13
	push	r14
	push	r15
	lea	rsp,[((-40))+rsp]
	movaps	XMMWORD[rsp],xmm6
	movaps	XMMWORD[16+rsp],xmm7
$L$mul_alloca:
	mov	rax,rsp
	lea	r11,[2+r9]
	neg	r11
	lea	rsp,[r11*8+rsp]
	and	rsp,-1024

	mov	QWORD[8+r9*8+rsp],rax
$L$mul_body:
	mov	r12,rdx
	mov	r11,r10
	shr	r10,3
	and	r11,7
	not	r10
	lea	rax,[$L$magic_masks]
	and	r10,3
	lea	r12,[96+r11*8+r12]
	movq	xmm4,QWORD[r10*8+rax]
	movq	xmm5,QWORD[8+r10*8+rax]
	movq	xmm6,QWORD[16+r10*8+rax]
	movq	xmm7,QWORD[24+r10*8+rax]

	movq	xmm0,QWORD[((-96))+r12]
	movq	xmm1,QWORD[((-32))+r12]
	pand	xmm0,xmm4
	movq	xmm2,QWORD[32+r12]
	pand	xmm1,xmm5
	movq	xmm3,QWORD[96+r12]
	pand	xmm2,xmm6
	por	xmm0,xmm1
	pand	xmm3,xmm7
	por	xmm0,xmm2
	lea	r12,[256+r12]
	por	xmm0,xmm3

DB	102,72,15,126,195

	mov	r8,QWORD[r8]
	mov	rax,QWORD[rsi]

	xor	r14,r14
	xor	r15,r15

	movq	xmm0,QWORD[((-96))+r12]
	movq	xmm1,QWORD[((-32))+r12]
	pand	xmm0,xmm4
	movq	xmm2,QWORD[32+r12]
	pand	xmm1,xmm5

	mov	rbp,r8
	mul	rbx
	mov	r10,rax
	mov	rax,QWORD[rcx]

	movq	xmm3,QWORD[96+r12]
	pand	xmm2,xmm6
	por	xmm0,xmm1
	pand	xmm3,xmm7

	imul	rbp,r10
	mov	r11,rdx

	por	xmm0,xmm2
	lea	r12,[256+r12]
	por	xmm0,xmm3

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

DB	102,72,15,126,195

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
	xor	r15,r15
	mov	rbp,r8
	mov	r10,QWORD[rsp]

	movq	xmm0,QWORD[((-96))+r12]
	movq	xmm1,QWORD[((-32))+r12]
	pand	xmm0,xmm4
	movq	xmm2,QWORD[32+r12]
	pand	xmm1,xmm5

	mul	rbx
	add	r10,rax
	mov	rax,QWORD[rcx]
	adc	rdx,0

	movq	xmm3,QWORD[96+r12]
	pand	xmm2,xmm6
	por	xmm0,xmm1
	pand	xmm3,xmm7

	imul	rbp,r10
	mov	r11,rdx

	por	xmm0,xmm2
	lea	r12,[256+r12]
	por	xmm0,xmm3

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

DB	102,72,15,126,195

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
	movaps	xmm6,XMMWORD[rsi]
	movaps	xmm7,XMMWORD[16+rsi]
	lea	rsi,[40+rsi]
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
$L$SEH_end_bn_mul_mont_gather5:

ALIGN	16
bn_mul4x_mont_gather5:
	mov	QWORD[8+rsp],rdi	;WIN64 prologue
	mov	QWORD[16+rsp],rsi
	mov	rax,rsp
$L$SEH_begin_bn_mul4x_mont_gather5:
	mov	rdi,rcx
	mov	rsi,rdx
	mov	rdx,r8
	mov	rcx,r9
	mov	r8,QWORD[40+rsp]
	mov	r9,QWORD[48+rsp]


$L$mul4x_enter:
	mov	r9d,r9d
	mov	r10d,DWORD[56+rsp]
	push	rbx
	push	rbp
	push	r12
	push	r13
	push	r14
	push	r15
	lea	rsp,[((-40))+rsp]
	movaps	XMMWORD[rsp],xmm6
	movaps	XMMWORD[16+rsp],xmm7
$L$mul4x_alloca:
	mov	rax,rsp
	lea	r11,[4+r9]
	neg	r11
	lea	rsp,[r11*8+rsp]
	and	rsp,-1024

	mov	QWORD[8+r9*8+rsp],rax
$L$mul4x_body:
	mov	QWORD[16+r9*8+rsp],rdi
	mov	r12,rdx
	mov	r11,r10
	shr	r10,3
	and	r11,7
	not	r10
	lea	rax,[$L$magic_masks]
	and	r10,3
	lea	r12,[96+r11*8+r12]
	movq	xmm4,QWORD[r10*8+rax]
	movq	xmm5,QWORD[8+r10*8+rax]
	movq	xmm6,QWORD[16+r10*8+rax]
	movq	xmm7,QWORD[24+r10*8+rax]

	movq	xmm0,QWORD[((-96))+r12]
	movq	xmm1,QWORD[((-32))+r12]
	pand	xmm0,xmm4
	movq	xmm2,QWORD[32+r12]
	pand	xmm1,xmm5
	movq	xmm3,QWORD[96+r12]
	pand	xmm2,xmm6
	por	xmm0,xmm1
	pand	xmm3,xmm7
	por	xmm0,xmm2
	lea	r12,[256+r12]
	por	xmm0,xmm3

DB	102,72,15,126,195
	mov	r8,QWORD[r8]
	mov	rax,QWORD[rsi]

	xor	r14,r14
	xor	r15,r15

	movq	xmm0,QWORD[((-96))+r12]
	movq	xmm1,QWORD[((-32))+r12]
	pand	xmm0,xmm4
	movq	xmm2,QWORD[32+r12]
	pand	xmm1,xmm5

	mov	rbp,r8
	mul	rbx
	mov	r10,rax
	mov	rax,QWORD[rcx]

	movq	xmm3,QWORD[96+r12]
	pand	xmm2,xmm6
	por	xmm0,xmm1
	pand	xmm3,xmm7

	imul	rbp,r10
	mov	r11,rdx

	por	xmm0,xmm2
	lea	r12,[256+r12]
	por	xmm0,xmm3

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

DB	102,72,15,126,195

	xor	rdi,rdi
	add	r13,r10
	adc	rdi,0
	mov	QWORD[((-8))+r15*8+rsp],r13
	mov	QWORD[r15*8+rsp],rdi

	lea	r14,[1+r14]
ALIGN	4
$L$outer4x:
	xor	r15,r15
	movq	xmm0,QWORD[((-96))+r12]
	movq	xmm1,QWORD[((-32))+r12]
	pand	xmm0,xmm4
	movq	xmm2,QWORD[32+r12]
	pand	xmm1,xmm5

	mov	r10,QWORD[rsp]
	mov	rbp,r8
	mul	rbx
	add	r10,rax
	mov	rax,QWORD[rcx]
	adc	rdx,0

	movq	xmm3,QWORD[96+r12]
	pand	xmm2,xmm6
	por	xmm0,xmm1
	pand	xmm3,xmm7

	imul	rbp,r10
	mov	r11,rdx

	por	xmm0,xmm2
	lea	r12,[256+r12]
	por	xmm0,xmm3

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
	mov	QWORD[((-32))+r15*8+rsp],rdi
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
	mov	QWORD[((-24))+r15*8+rsp],r13
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
	mov	QWORD[((-16))+r15*8+rsp],rdi
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
	mov	QWORD[((-40))+r15*8+rsp],r13
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
	mov	QWORD[((-32))+r15*8+rsp],rdi
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
	mov	QWORD[((-24))+r15*8+rsp],r13
	mov	r13,rdx

DB	102,72,15,126,195
	mov	QWORD[((-16))+r15*8+rsp],rdi

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
	movaps	xmm6,XMMWORD[rsi]
	movaps	xmm7,XMMWORD[16+rsi]
	lea	rsi,[40+rsi]
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
$L$SEH_end_bn_mul4x_mont_gather5:
global	bn_scatter5

ALIGN	16
bn_scatter5:
	cmp	rdx,0
	jz	NEAR $L$scatter_epilogue
	lea	r8,[r9*8+r8]
$L$scatter:
	mov	rax,QWORD[rcx]
	lea	rcx,[8+rcx]
	mov	QWORD[r8],rax
	lea	r8,[256+r8]
	sub	rdx,1
	jnz	NEAR $L$scatter
$L$scatter_epilogue:
	DB	0F3h,0C3h		;repret


global	bn_gather5

ALIGN	16
bn_gather5:
$L$SEH_begin_bn_gather5:

DB	0x48,0x83,0xec,0x28		
DB	0x0f,0x29,0x34,0x24		
DB	0x0f,0x29,0x7c,0x24,0x10	
	mov	r11,r9
	shr	r9,3
	and	r11,7
	not	r9
	lea	rax,[$L$magic_masks]
	and	r9,3
	lea	r8,[96+r11*8+r8]
	movq	xmm4,QWORD[r9*8+rax]
	movq	xmm5,QWORD[8+r9*8+rax]
	movq	xmm6,QWORD[16+r9*8+rax]
	movq	xmm7,QWORD[24+r9*8+rax]
	jmp	NEAR $L$gather
ALIGN	16
$L$gather:
	movq	xmm0,QWORD[((-96))+r8]
	movq	xmm1,QWORD[((-32))+r8]
	pand	xmm0,xmm4
	movq	xmm2,QWORD[32+r8]
	pand	xmm1,xmm5
	movq	xmm3,QWORD[96+r8]
	pand	xmm2,xmm6
	por	xmm0,xmm1
	pand	xmm3,xmm7
	por	xmm0,xmm2
	lea	r8,[256+r8]
	por	xmm0,xmm3

	movq	QWORD[rcx],xmm0
	lea	rcx,[8+rcx]
	sub	rdx,1
	jnz	NEAR $L$gather
	movaps	xmm6,XMMWORD[rsp]
	movaps	xmm7,XMMWORD[16+rsp]
	lea	rsp,[40+rsp]
	DB	0F3h,0C3h		;repret
$L$SEH_end_bn_gather5:

ALIGN	64
$L$magic_masks:
	DD	0,0,0,0,0,0,-1,-1
	DD	0,0,0,0,0,0,0,0
DB	77,111,110,116,103,111,109,101,114,121,32,77,117,108,116,105
DB	112,108,105,99,97,116,105,111,110,32,119,105,116,104,32,115
DB	99,97,116,116,101,114,47,103,97,116,104,101,114,32,102,111
DB	114,32,120,56,54,95,54,52,44,32,67,82,89,80,84,79
DB	71,65,77,83,32,98,121,32,60,97,112,112,114,111,64,111
DB	112,101,110,115,115,108,46,111,114,103,62,0
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

	lea	rax,[88+rax]

	mov	r10d,DWORD[4+r11]
	lea	r10,[r10*1+rsi]
	cmp	rbx,r10
	jb	NEAR $L$common_seh_tail

	mov	rax,QWORD[152+r8]

	mov	r10d,DWORD[8+r11]
	lea	r10,[r10*1+rsi]
	cmp	rbx,r10
	jae	NEAR $L$common_seh_tail

	mov	r10,QWORD[192+r8]
	mov	rax,QWORD[8+r10*8+rax]

	movaps	xmm0,XMMWORD[rax]
	movaps	xmm1,XMMWORD[16+rax]
	lea	rax,[88+rax]

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
	movups	XMMWORD[512+r8],xmm0
	movups	XMMWORD[528+r8],xmm1

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
	DD	$L$SEH_begin_bn_mul_mont_gather5 wrt ..imagebase
	DD	$L$SEH_end_bn_mul_mont_gather5 wrt ..imagebase
	DD	$L$SEH_info_bn_mul_mont_gather5 wrt ..imagebase

	DD	$L$SEH_begin_bn_mul4x_mont_gather5 wrt ..imagebase
	DD	$L$SEH_end_bn_mul4x_mont_gather5 wrt ..imagebase
	DD	$L$SEH_info_bn_mul4x_mont_gather5 wrt ..imagebase

	DD	$L$SEH_begin_bn_gather5 wrt ..imagebase
	DD	$L$SEH_end_bn_gather5 wrt ..imagebase
	DD	$L$SEH_info_bn_gather5 wrt ..imagebase

section	.xdata rdata align=8
ALIGN	8
$L$SEH_info_bn_mul_mont_gather5:
DB	9,0,0,0
	DD	mul_handler wrt ..imagebase
	DD	$L$mul_alloca wrt ..imagebase,$L$mul_body wrt ..imagebase,$L$mul_epilogue wrt ..imagebase		
ALIGN	8
$L$SEH_info_bn_mul4x_mont_gather5:
DB	9,0,0,0
	DD	mul_handler wrt ..imagebase
	DD	$L$mul4x_alloca wrt ..imagebase,$L$mul4x_body wrt ..imagebase,$L$mul4x_epilogue wrt ..imagebase	
ALIGN	8
$L$SEH_info_bn_gather5:
DB	0x01,0x0d,0x05,0x00
DB	0x0d,0x78,0x01,0x00	
DB	0x08,0x68,0x00,0x00	
DB	0x04,0x42,0x00,0x00	
ALIGN	8
