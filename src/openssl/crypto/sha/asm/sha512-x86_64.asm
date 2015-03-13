default	rel
%define XMMWORD
section	.text code align=64


global	sha512_block_data_order

ALIGN	16
sha512_block_data_order:
	mov	QWORD[8+rsp],rdi	;WIN64 prologue
	mov	QWORD[16+rsp],rsi
	mov	rax,rsp
$L$SEH_begin_sha512_block_data_order:
	mov	rdi,rcx
	mov	rsi,rdx
	mov	rdx,r8
	mov	rcx,r9


	push	rbx
	push	rbp
	push	r12
	push	r13
	push	r14
	push	r15
	mov	r11,rsp
	shl	rdx,4
	sub	rsp,16*8+4*8
	lea	rdx,[rdx*8+rsi]
	and	rsp,-64
	mov	QWORD[((128+0))+rsp],rdi
	mov	QWORD[((128+8))+rsp],rsi
	mov	QWORD[((128+16))+rsp],rdx
	mov	QWORD[((128+24))+rsp],r11
$L$prologue:

	lea	rbp,[K512]

	mov	rax,QWORD[rdi]
	mov	rbx,QWORD[8+rdi]
	mov	rcx,QWORD[16+rdi]
	mov	rdx,QWORD[24+rdi]
	mov	r8,QWORD[32+rdi]
	mov	r9,QWORD[40+rdi]
	mov	r10,QWORD[48+rdi]
	mov	r11,QWORD[56+rdi]
	jmp	NEAR $L$loop

ALIGN	16
$L$loop:
	xor	rdi,rdi
	mov	r12,QWORD[rsi]
	mov	r13,r8
	mov	r14,rax
	bswap	r12
	ror	r13,23
	mov	r15,r9
	mov	QWORD[rsp],r12

	ror	r14,5
	xor	r13,r8
	xor	r15,r10

	ror	r13,4
	add	r12,r11
	xor	r14,rax

	add	r12,QWORD[rdi*8+rbp]
	and	r15,r8
	mov	r11,rbx

	ror	r14,6
	xor	r13,r8
	xor	r15,r10

	xor	r11,rcx
	xor	r14,rax
	add	r12,r15
	mov	r15,rbx

	ror	r13,14
	and	r11,rax
	and	r15,rcx

	ror	r14,28
	add	r12,r13
	add	r11,r15

	add	rdx,r12
	add	r11,r12
	lea	rdi,[1+rdi]
	add	r11,r14

	mov	r12,QWORD[8+rsi]
	mov	r13,rdx
	mov	r14,r11
	bswap	r12
	ror	r13,23
	mov	r15,r8
	mov	QWORD[8+rsp],r12

	ror	r14,5
	xor	r13,rdx
	xor	r15,r9

	ror	r13,4
	add	r12,r10
	xor	r14,r11

	add	r12,QWORD[rdi*8+rbp]
	and	r15,rdx
	mov	r10,rax

	ror	r14,6
	xor	r13,rdx
	xor	r15,r9

	xor	r10,rbx
	xor	r14,r11
	add	r12,r15
	mov	r15,rax

	ror	r13,14
	and	r10,r11
	and	r15,rbx

	ror	r14,28
	add	r12,r13
	add	r10,r15

	add	rcx,r12
	add	r10,r12
	lea	rdi,[1+rdi]
	add	r10,r14

	mov	r12,QWORD[16+rsi]
	mov	r13,rcx
	mov	r14,r10
	bswap	r12
	ror	r13,23
	mov	r15,rdx
	mov	QWORD[16+rsp],r12

	ror	r14,5
	xor	r13,rcx
	xor	r15,r8

	ror	r13,4
	add	r12,r9
	xor	r14,r10

	add	r12,QWORD[rdi*8+rbp]
	and	r15,rcx
	mov	r9,r11

	ror	r14,6
	xor	r13,rcx
	xor	r15,r8

	xor	r9,rax
	xor	r14,r10
	add	r12,r15
	mov	r15,r11

	ror	r13,14
	and	r9,r10
	and	r15,rax

	ror	r14,28
	add	r12,r13
	add	r9,r15

	add	rbx,r12
	add	r9,r12
	lea	rdi,[1+rdi]
	add	r9,r14

	mov	r12,QWORD[24+rsi]
	mov	r13,rbx
	mov	r14,r9
	bswap	r12
	ror	r13,23
	mov	r15,rcx
	mov	QWORD[24+rsp],r12

	ror	r14,5
	xor	r13,rbx
	xor	r15,rdx

	ror	r13,4
	add	r12,r8
	xor	r14,r9

	add	r12,QWORD[rdi*8+rbp]
	and	r15,rbx
	mov	r8,r10

	ror	r14,6
	xor	r13,rbx
	xor	r15,rdx

	xor	r8,r11
	xor	r14,r9
	add	r12,r15
	mov	r15,r10

	ror	r13,14
	and	r8,r9
	and	r15,r11

	ror	r14,28
	add	r12,r13
	add	r8,r15

	add	rax,r12
	add	r8,r12
	lea	rdi,[1+rdi]
	add	r8,r14

	mov	r12,QWORD[32+rsi]
	mov	r13,rax
	mov	r14,r8
	bswap	r12
	ror	r13,23
	mov	r15,rbx
	mov	QWORD[32+rsp],r12

	ror	r14,5
	xor	r13,rax
	xor	r15,rcx

	ror	r13,4
	add	r12,rdx
	xor	r14,r8

	add	r12,QWORD[rdi*8+rbp]
	and	r15,rax
	mov	rdx,r9

	ror	r14,6
	xor	r13,rax
	xor	r15,rcx

	xor	rdx,r10
	xor	r14,r8
	add	r12,r15
	mov	r15,r9

	ror	r13,14
	and	rdx,r8
	and	r15,r10

	ror	r14,28
	add	r12,r13
	add	rdx,r15

	add	r11,r12
	add	rdx,r12
	lea	rdi,[1+rdi]
	add	rdx,r14

	mov	r12,QWORD[40+rsi]
	mov	r13,r11
	mov	r14,rdx
	bswap	r12
	ror	r13,23
	mov	r15,rax
	mov	QWORD[40+rsp],r12

	ror	r14,5
	xor	r13,r11
	xor	r15,rbx

	ror	r13,4
	add	r12,rcx
	xor	r14,rdx

	add	r12,QWORD[rdi*8+rbp]
	and	r15,r11
	mov	rcx,r8

	ror	r14,6
	xor	r13,r11
	xor	r15,rbx

	xor	rcx,r9
	xor	r14,rdx
	add	r12,r15
	mov	r15,r8

	ror	r13,14
	and	rcx,rdx
	and	r15,r9

	ror	r14,28
	add	r12,r13
	add	rcx,r15

	add	r10,r12
	add	rcx,r12
	lea	rdi,[1+rdi]
	add	rcx,r14

	mov	r12,QWORD[48+rsi]
	mov	r13,r10
	mov	r14,rcx
	bswap	r12
	ror	r13,23
	mov	r15,r11
	mov	QWORD[48+rsp],r12

	ror	r14,5
	xor	r13,r10
	xor	r15,rax

	ror	r13,4
	add	r12,rbx
	xor	r14,rcx

	add	r12,QWORD[rdi*8+rbp]
	and	r15,r10
	mov	rbx,rdx

	ror	r14,6
	xor	r13,r10
	xor	r15,rax

	xor	rbx,r8
	xor	r14,rcx
	add	r12,r15
	mov	r15,rdx

	ror	r13,14
	and	rbx,rcx
	and	r15,r8

	ror	r14,28
	add	r12,r13
	add	rbx,r15

	add	r9,r12
	add	rbx,r12
	lea	rdi,[1+rdi]
	add	rbx,r14

	mov	r12,QWORD[56+rsi]
	mov	r13,r9
	mov	r14,rbx
	bswap	r12
	ror	r13,23
	mov	r15,r10
	mov	QWORD[56+rsp],r12

	ror	r14,5
	xor	r13,r9
	xor	r15,r11

	ror	r13,4
	add	r12,rax
	xor	r14,rbx

	add	r12,QWORD[rdi*8+rbp]
	and	r15,r9
	mov	rax,rcx

	ror	r14,6
	xor	r13,r9
	xor	r15,r11

	xor	rax,rdx
	xor	r14,rbx
	add	r12,r15
	mov	r15,rcx

	ror	r13,14
	and	rax,rbx
	and	r15,rdx

	ror	r14,28
	add	r12,r13
	add	rax,r15

	add	r8,r12
	add	rax,r12
	lea	rdi,[1+rdi]
	add	rax,r14

	mov	r12,QWORD[64+rsi]
	mov	r13,r8
	mov	r14,rax
	bswap	r12
	ror	r13,23
	mov	r15,r9
	mov	QWORD[64+rsp],r12

	ror	r14,5
	xor	r13,r8
	xor	r15,r10

	ror	r13,4
	add	r12,r11
	xor	r14,rax

	add	r12,QWORD[rdi*8+rbp]
	and	r15,r8
	mov	r11,rbx

	ror	r14,6
	xor	r13,r8
	xor	r15,r10

	xor	r11,rcx
	xor	r14,rax
	add	r12,r15
	mov	r15,rbx

	ror	r13,14
	and	r11,rax
	and	r15,rcx

	ror	r14,28
	add	r12,r13
	add	r11,r15

	add	rdx,r12
	add	r11,r12
	lea	rdi,[1+rdi]
	add	r11,r14

	mov	r12,QWORD[72+rsi]
	mov	r13,rdx
	mov	r14,r11
	bswap	r12
	ror	r13,23
	mov	r15,r8
	mov	QWORD[72+rsp],r12

	ror	r14,5
	xor	r13,rdx
	xor	r15,r9

	ror	r13,4
	add	r12,r10
	xor	r14,r11

	add	r12,QWORD[rdi*8+rbp]
	and	r15,rdx
	mov	r10,rax

	ror	r14,6
	xor	r13,rdx
	xor	r15,r9

	xor	r10,rbx
	xor	r14,r11
	add	r12,r15
	mov	r15,rax

	ror	r13,14
	and	r10,r11
	and	r15,rbx

	ror	r14,28
	add	r12,r13
	add	r10,r15

	add	rcx,r12
	add	r10,r12
	lea	rdi,[1+rdi]
	add	r10,r14

	mov	r12,QWORD[80+rsi]
	mov	r13,rcx
	mov	r14,r10
	bswap	r12
	ror	r13,23
	mov	r15,rdx
	mov	QWORD[80+rsp],r12

	ror	r14,5
	xor	r13,rcx
	xor	r15,r8

	ror	r13,4
	add	r12,r9
	xor	r14,r10

	add	r12,QWORD[rdi*8+rbp]
	and	r15,rcx
	mov	r9,r11

	ror	r14,6
	xor	r13,rcx
	xor	r15,r8

	xor	r9,rax
	xor	r14,r10
	add	r12,r15
	mov	r15,r11

	ror	r13,14
	and	r9,r10
	and	r15,rax

	ror	r14,28
	add	r12,r13
	add	r9,r15

	add	rbx,r12
	add	r9,r12
	lea	rdi,[1+rdi]
	add	r9,r14

	mov	r12,QWORD[88+rsi]
	mov	r13,rbx
	mov	r14,r9
	bswap	r12
	ror	r13,23
	mov	r15,rcx
	mov	QWORD[88+rsp],r12

	ror	r14,5
	xor	r13,rbx
	xor	r15,rdx

	ror	r13,4
	add	r12,r8
	xor	r14,r9

	add	r12,QWORD[rdi*8+rbp]
	and	r15,rbx
	mov	r8,r10

	ror	r14,6
	xor	r13,rbx
	xor	r15,rdx

	xor	r8,r11
	xor	r14,r9
	add	r12,r15
	mov	r15,r10

	ror	r13,14
	and	r8,r9
	and	r15,r11

	ror	r14,28
	add	r12,r13
	add	r8,r15

	add	rax,r12
	add	r8,r12
	lea	rdi,[1+rdi]
	add	r8,r14

	mov	r12,QWORD[96+rsi]
	mov	r13,rax
	mov	r14,r8
	bswap	r12
	ror	r13,23
	mov	r15,rbx
	mov	QWORD[96+rsp],r12

	ror	r14,5
	xor	r13,rax
	xor	r15,rcx

	ror	r13,4
	add	r12,rdx
	xor	r14,r8

	add	r12,QWORD[rdi*8+rbp]
	and	r15,rax
	mov	rdx,r9

	ror	r14,6
	xor	r13,rax
	xor	r15,rcx

	xor	rdx,r10
	xor	r14,r8
	add	r12,r15
	mov	r15,r9

	ror	r13,14
	and	rdx,r8
	and	r15,r10

	ror	r14,28
	add	r12,r13
	add	rdx,r15

	add	r11,r12
	add	rdx,r12
	lea	rdi,[1+rdi]
	add	rdx,r14

	mov	r12,QWORD[104+rsi]
	mov	r13,r11
	mov	r14,rdx
	bswap	r12
	ror	r13,23
	mov	r15,rax
	mov	QWORD[104+rsp],r12

	ror	r14,5
	xor	r13,r11
	xor	r15,rbx

	ror	r13,4
	add	r12,rcx
	xor	r14,rdx

	add	r12,QWORD[rdi*8+rbp]
	and	r15,r11
	mov	rcx,r8

	ror	r14,6
	xor	r13,r11
	xor	r15,rbx

	xor	rcx,r9
	xor	r14,rdx
	add	r12,r15
	mov	r15,r8

	ror	r13,14
	and	rcx,rdx
	and	r15,r9

	ror	r14,28
	add	r12,r13
	add	rcx,r15

	add	r10,r12
	add	rcx,r12
	lea	rdi,[1+rdi]
	add	rcx,r14

	mov	r12,QWORD[112+rsi]
	mov	r13,r10
	mov	r14,rcx
	bswap	r12
	ror	r13,23
	mov	r15,r11
	mov	QWORD[112+rsp],r12

	ror	r14,5
	xor	r13,r10
	xor	r15,rax

	ror	r13,4
	add	r12,rbx
	xor	r14,rcx

	add	r12,QWORD[rdi*8+rbp]
	and	r15,r10
	mov	rbx,rdx

	ror	r14,6
	xor	r13,r10
	xor	r15,rax

	xor	rbx,r8
	xor	r14,rcx
	add	r12,r15
	mov	r15,rdx

	ror	r13,14
	and	rbx,rcx
	and	r15,r8

	ror	r14,28
	add	r12,r13
	add	rbx,r15

	add	r9,r12
	add	rbx,r12
	lea	rdi,[1+rdi]
	add	rbx,r14

	mov	r12,QWORD[120+rsi]
	mov	r13,r9
	mov	r14,rbx
	bswap	r12
	ror	r13,23
	mov	r15,r10
	mov	QWORD[120+rsp],r12

	ror	r14,5
	xor	r13,r9
	xor	r15,r11

	ror	r13,4
	add	r12,rax
	xor	r14,rbx

	add	r12,QWORD[rdi*8+rbp]
	and	r15,r9
	mov	rax,rcx

	ror	r14,6
	xor	r13,r9
	xor	r15,r11

	xor	rax,rdx
	xor	r14,rbx
	add	r12,r15
	mov	r15,rcx

	ror	r13,14
	and	rax,rbx
	and	r15,rdx

	ror	r14,28
	add	r12,r13
	add	rax,r15

	add	r8,r12
	add	rax,r12
	lea	rdi,[1+rdi]
	add	rax,r14

	jmp	NEAR $L$rounds_16_xx
ALIGN	16
$L$rounds_16_xx:
	mov	r13,QWORD[8+rsp]
	mov	r14,QWORD[112+rsp]
	mov	r12,r13
	mov	r15,r14

	ror	r12,7
	xor	r12,r13
	shr	r13,7

	ror	r12,1
	xor	r13,r12
	mov	r12,QWORD[72+rsp]

	ror	r15,42
	xor	r15,r14
	shr	r14,6

	ror	r15,19
	add	r12,r13
	xor	r14,r15

	add	r12,QWORD[rsp]
	mov	r13,r8
	add	r12,r14
	mov	r14,rax
	ror	r13,23
	mov	r15,r9
	mov	QWORD[rsp],r12

	ror	r14,5
	xor	r13,r8
	xor	r15,r10

	ror	r13,4
	add	r12,r11
	xor	r14,rax

	add	r12,QWORD[rdi*8+rbp]
	and	r15,r8
	mov	r11,rbx

	ror	r14,6
	xor	r13,r8
	xor	r15,r10

	xor	r11,rcx
	xor	r14,rax
	add	r12,r15
	mov	r15,rbx

	ror	r13,14
	and	r11,rax
	and	r15,rcx

	ror	r14,28
	add	r12,r13
	add	r11,r15

	add	rdx,r12
	add	r11,r12
	lea	rdi,[1+rdi]
	add	r11,r14

	mov	r13,QWORD[16+rsp]
	mov	r14,QWORD[120+rsp]
	mov	r12,r13
	mov	r15,r14

	ror	r12,7
	xor	r12,r13
	shr	r13,7

	ror	r12,1
	xor	r13,r12
	mov	r12,QWORD[80+rsp]

	ror	r15,42
	xor	r15,r14
	shr	r14,6

	ror	r15,19
	add	r12,r13
	xor	r14,r15

	add	r12,QWORD[8+rsp]
	mov	r13,rdx
	add	r12,r14
	mov	r14,r11
	ror	r13,23
	mov	r15,r8
	mov	QWORD[8+rsp],r12

	ror	r14,5
	xor	r13,rdx
	xor	r15,r9

	ror	r13,4
	add	r12,r10
	xor	r14,r11

	add	r12,QWORD[rdi*8+rbp]
	and	r15,rdx
	mov	r10,rax

	ror	r14,6
	xor	r13,rdx
	xor	r15,r9

	xor	r10,rbx
	xor	r14,r11
	add	r12,r15
	mov	r15,rax

	ror	r13,14
	and	r10,r11
	and	r15,rbx

	ror	r14,28
	add	r12,r13
	add	r10,r15

	add	rcx,r12
	add	r10,r12
	lea	rdi,[1+rdi]
	add	r10,r14

	mov	r13,QWORD[24+rsp]
	mov	r14,QWORD[rsp]
	mov	r12,r13
	mov	r15,r14

	ror	r12,7
	xor	r12,r13
	shr	r13,7

	ror	r12,1
	xor	r13,r12
	mov	r12,QWORD[88+rsp]

	ror	r15,42
	xor	r15,r14
	shr	r14,6

	ror	r15,19
	add	r12,r13
	xor	r14,r15

	add	r12,QWORD[16+rsp]
	mov	r13,rcx
	add	r12,r14
	mov	r14,r10
	ror	r13,23
	mov	r15,rdx
	mov	QWORD[16+rsp],r12

	ror	r14,5
	xor	r13,rcx
	xor	r15,r8

	ror	r13,4
	add	r12,r9
	xor	r14,r10

	add	r12,QWORD[rdi*8+rbp]
	and	r15,rcx
	mov	r9,r11

	ror	r14,6
	xor	r13,rcx
	xor	r15,r8

	xor	r9,rax
	xor	r14,r10
	add	r12,r15
	mov	r15,r11

	ror	r13,14
	and	r9,r10
	and	r15,rax

	ror	r14,28
	add	r12,r13
	add	r9,r15

	add	rbx,r12
	add	r9,r12
	lea	rdi,[1+rdi]
	add	r9,r14

	mov	r13,QWORD[32+rsp]
	mov	r14,QWORD[8+rsp]
	mov	r12,r13
	mov	r15,r14

	ror	r12,7
	xor	r12,r13
	shr	r13,7

	ror	r12,1
	xor	r13,r12
	mov	r12,QWORD[96+rsp]

	ror	r15,42
	xor	r15,r14
	shr	r14,6

	ror	r15,19
	add	r12,r13
	xor	r14,r15

	add	r12,QWORD[24+rsp]
	mov	r13,rbx
	add	r12,r14
	mov	r14,r9
	ror	r13,23
	mov	r15,rcx
	mov	QWORD[24+rsp],r12

	ror	r14,5
	xor	r13,rbx
	xor	r15,rdx

	ror	r13,4
	add	r12,r8
	xor	r14,r9

	add	r12,QWORD[rdi*8+rbp]
	and	r15,rbx
	mov	r8,r10

	ror	r14,6
	xor	r13,rbx
	xor	r15,rdx

	xor	r8,r11
	xor	r14,r9
	add	r12,r15
	mov	r15,r10

	ror	r13,14
	and	r8,r9
	and	r15,r11

	ror	r14,28
	add	r12,r13
	add	r8,r15

	add	rax,r12
	add	r8,r12
	lea	rdi,[1+rdi]
	add	r8,r14

	mov	r13,QWORD[40+rsp]
	mov	r14,QWORD[16+rsp]
	mov	r12,r13
	mov	r15,r14

	ror	r12,7
	xor	r12,r13
	shr	r13,7

	ror	r12,1
	xor	r13,r12
	mov	r12,QWORD[104+rsp]

	ror	r15,42
	xor	r15,r14
	shr	r14,6

	ror	r15,19
	add	r12,r13
	xor	r14,r15

	add	r12,QWORD[32+rsp]
	mov	r13,rax
	add	r12,r14
	mov	r14,r8
	ror	r13,23
	mov	r15,rbx
	mov	QWORD[32+rsp],r12

	ror	r14,5
	xor	r13,rax
	xor	r15,rcx

	ror	r13,4
	add	r12,rdx
	xor	r14,r8

	add	r12,QWORD[rdi*8+rbp]
	and	r15,rax
	mov	rdx,r9

	ror	r14,6
	xor	r13,rax
	xor	r15,rcx

	xor	rdx,r10
	xor	r14,r8
	add	r12,r15
	mov	r15,r9

	ror	r13,14
	and	rdx,r8
	and	r15,r10

	ror	r14,28
	add	r12,r13
	add	rdx,r15

	add	r11,r12
	add	rdx,r12
	lea	rdi,[1+rdi]
	add	rdx,r14

	mov	r13,QWORD[48+rsp]
	mov	r14,QWORD[24+rsp]
	mov	r12,r13
	mov	r15,r14

	ror	r12,7
	xor	r12,r13
	shr	r13,7

	ror	r12,1
	xor	r13,r12
	mov	r12,QWORD[112+rsp]

	ror	r15,42
	xor	r15,r14
	shr	r14,6

	ror	r15,19
	add	r12,r13
	xor	r14,r15

	add	r12,QWORD[40+rsp]
	mov	r13,r11
	add	r12,r14
	mov	r14,rdx
	ror	r13,23
	mov	r15,rax
	mov	QWORD[40+rsp],r12

	ror	r14,5
	xor	r13,r11
	xor	r15,rbx

	ror	r13,4
	add	r12,rcx
	xor	r14,rdx

	add	r12,QWORD[rdi*8+rbp]
	and	r15,r11
	mov	rcx,r8

	ror	r14,6
	xor	r13,r11
	xor	r15,rbx

	xor	rcx,r9
	xor	r14,rdx
	add	r12,r15
	mov	r15,r8

	ror	r13,14
	and	rcx,rdx
	and	r15,r9

	ror	r14,28
	add	r12,r13
	add	rcx,r15

	add	r10,r12
	add	rcx,r12
	lea	rdi,[1+rdi]
	add	rcx,r14

	mov	r13,QWORD[56+rsp]
	mov	r14,QWORD[32+rsp]
	mov	r12,r13
	mov	r15,r14

	ror	r12,7
	xor	r12,r13
	shr	r13,7

	ror	r12,1
	xor	r13,r12
	mov	r12,QWORD[120+rsp]

	ror	r15,42
	xor	r15,r14
	shr	r14,6

	ror	r15,19
	add	r12,r13
	xor	r14,r15

	add	r12,QWORD[48+rsp]
	mov	r13,r10
	add	r12,r14
	mov	r14,rcx
	ror	r13,23
	mov	r15,r11
	mov	QWORD[48+rsp],r12

	ror	r14,5
	xor	r13,r10
	xor	r15,rax

	ror	r13,4
	add	r12,rbx
	xor	r14,rcx

	add	r12,QWORD[rdi*8+rbp]
	and	r15,r10
	mov	rbx,rdx

	ror	r14,6
	xor	r13,r10
	xor	r15,rax

	xor	rbx,r8
	xor	r14,rcx
	add	r12,r15
	mov	r15,rdx

	ror	r13,14
	and	rbx,rcx
	and	r15,r8

	ror	r14,28
	add	r12,r13
	add	rbx,r15

	add	r9,r12
	add	rbx,r12
	lea	rdi,[1+rdi]
	add	rbx,r14

	mov	r13,QWORD[64+rsp]
	mov	r14,QWORD[40+rsp]
	mov	r12,r13
	mov	r15,r14

	ror	r12,7
	xor	r12,r13
	shr	r13,7

	ror	r12,1
	xor	r13,r12
	mov	r12,QWORD[rsp]

	ror	r15,42
	xor	r15,r14
	shr	r14,6

	ror	r15,19
	add	r12,r13
	xor	r14,r15

	add	r12,QWORD[56+rsp]
	mov	r13,r9
	add	r12,r14
	mov	r14,rbx
	ror	r13,23
	mov	r15,r10
	mov	QWORD[56+rsp],r12

	ror	r14,5
	xor	r13,r9
	xor	r15,r11

	ror	r13,4
	add	r12,rax
	xor	r14,rbx

	add	r12,QWORD[rdi*8+rbp]
	and	r15,r9
	mov	rax,rcx

	ror	r14,6
	xor	r13,r9
	xor	r15,r11

	xor	rax,rdx
	xor	r14,rbx
	add	r12,r15
	mov	r15,rcx

	ror	r13,14
	and	rax,rbx
	and	r15,rdx

	ror	r14,28
	add	r12,r13
	add	rax,r15

	add	r8,r12
	add	rax,r12
	lea	rdi,[1+rdi]
	add	rax,r14

	mov	r13,QWORD[72+rsp]
	mov	r14,QWORD[48+rsp]
	mov	r12,r13
	mov	r15,r14

	ror	r12,7
	xor	r12,r13
	shr	r13,7

	ror	r12,1
	xor	r13,r12
	mov	r12,QWORD[8+rsp]

	ror	r15,42
	xor	r15,r14
	shr	r14,6

	ror	r15,19
	add	r12,r13
	xor	r14,r15

	add	r12,QWORD[64+rsp]
	mov	r13,r8
	add	r12,r14
	mov	r14,rax
	ror	r13,23
	mov	r15,r9
	mov	QWORD[64+rsp],r12

	ror	r14,5
	xor	r13,r8
	xor	r15,r10

	ror	r13,4
	add	r12,r11
	xor	r14,rax

	add	r12,QWORD[rdi*8+rbp]
	and	r15,r8
	mov	r11,rbx

	ror	r14,6
	xor	r13,r8
	xor	r15,r10

	xor	r11,rcx
	xor	r14,rax
	add	r12,r15
	mov	r15,rbx

	ror	r13,14
	and	r11,rax
	and	r15,rcx

	ror	r14,28
	add	r12,r13
	add	r11,r15

	add	rdx,r12
	add	r11,r12
	lea	rdi,[1+rdi]
	add	r11,r14

	mov	r13,QWORD[80+rsp]
	mov	r14,QWORD[56+rsp]
	mov	r12,r13
	mov	r15,r14

	ror	r12,7
	xor	r12,r13
	shr	r13,7

	ror	r12,1
	xor	r13,r12
	mov	r12,QWORD[16+rsp]

	ror	r15,42
	xor	r15,r14
	shr	r14,6

	ror	r15,19
	add	r12,r13
	xor	r14,r15

	add	r12,QWORD[72+rsp]
	mov	r13,rdx
	add	r12,r14
	mov	r14,r11
	ror	r13,23
	mov	r15,r8
	mov	QWORD[72+rsp],r12

	ror	r14,5
	xor	r13,rdx
	xor	r15,r9

	ror	r13,4
	add	r12,r10
	xor	r14,r11

	add	r12,QWORD[rdi*8+rbp]
	and	r15,rdx
	mov	r10,rax

	ror	r14,6
	xor	r13,rdx
	xor	r15,r9

	xor	r10,rbx
	xor	r14,r11
	add	r12,r15
	mov	r15,rax

	ror	r13,14
	and	r10,r11
	and	r15,rbx

	ror	r14,28
	add	r12,r13
	add	r10,r15

	add	rcx,r12
	add	r10,r12
	lea	rdi,[1+rdi]
	add	r10,r14

	mov	r13,QWORD[88+rsp]
	mov	r14,QWORD[64+rsp]
	mov	r12,r13
	mov	r15,r14

	ror	r12,7
	xor	r12,r13
	shr	r13,7

	ror	r12,1
	xor	r13,r12
	mov	r12,QWORD[24+rsp]

	ror	r15,42
	xor	r15,r14
	shr	r14,6

	ror	r15,19
	add	r12,r13
	xor	r14,r15

	add	r12,QWORD[80+rsp]
	mov	r13,rcx
	add	r12,r14
	mov	r14,r10
	ror	r13,23
	mov	r15,rdx
	mov	QWORD[80+rsp],r12

	ror	r14,5
	xor	r13,rcx
	xor	r15,r8

	ror	r13,4
	add	r12,r9
	xor	r14,r10

	add	r12,QWORD[rdi*8+rbp]
	and	r15,rcx
	mov	r9,r11

	ror	r14,6
	xor	r13,rcx
	xor	r15,r8

	xor	r9,rax
	xor	r14,r10
	add	r12,r15
	mov	r15,r11

	ror	r13,14
	and	r9,r10
	and	r15,rax

	ror	r14,28
	add	r12,r13
	add	r9,r15

	add	rbx,r12
	add	r9,r12
	lea	rdi,[1+rdi]
	add	r9,r14

	mov	r13,QWORD[96+rsp]
	mov	r14,QWORD[72+rsp]
	mov	r12,r13
	mov	r15,r14

	ror	r12,7
	xor	r12,r13
	shr	r13,7

	ror	r12,1
	xor	r13,r12
	mov	r12,QWORD[32+rsp]

	ror	r15,42
	xor	r15,r14
	shr	r14,6

	ror	r15,19
	add	r12,r13
	xor	r14,r15

	add	r12,QWORD[88+rsp]
	mov	r13,rbx
	add	r12,r14
	mov	r14,r9
	ror	r13,23
	mov	r15,rcx
	mov	QWORD[88+rsp],r12

	ror	r14,5
	xor	r13,rbx
	xor	r15,rdx

	ror	r13,4
	add	r12,r8
	xor	r14,r9

	add	r12,QWORD[rdi*8+rbp]
	and	r15,rbx
	mov	r8,r10

	ror	r14,6
	xor	r13,rbx
	xor	r15,rdx

	xor	r8,r11
	xor	r14,r9
	add	r12,r15
	mov	r15,r10

	ror	r13,14
	and	r8,r9
	and	r15,r11

	ror	r14,28
	add	r12,r13
	add	r8,r15

	add	rax,r12
	add	r8,r12
	lea	rdi,[1+rdi]
	add	r8,r14

	mov	r13,QWORD[104+rsp]
	mov	r14,QWORD[80+rsp]
	mov	r12,r13
	mov	r15,r14

	ror	r12,7
	xor	r12,r13
	shr	r13,7

	ror	r12,1
	xor	r13,r12
	mov	r12,QWORD[40+rsp]

	ror	r15,42
	xor	r15,r14
	shr	r14,6

	ror	r15,19
	add	r12,r13
	xor	r14,r15

	add	r12,QWORD[96+rsp]
	mov	r13,rax
	add	r12,r14
	mov	r14,r8
	ror	r13,23
	mov	r15,rbx
	mov	QWORD[96+rsp],r12

	ror	r14,5
	xor	r13,rax
	xor	r15,rcx

	ror	r13,4
	add	r12,rdx
	xor	r14,r8

	add	r12,QWORD[rdi*8+rbp]
	and	r15,rax
	mov	rdx,r9

	ror	r14,6
	xor	r13,rax
	xor	r15,rcx

	xor	rdx,r10
	xor	r14,r8
	add	r12,r15
	mov	r15,r9

	ror	r13,14
	and	rdx,r8
	and	r15,r10

	ror	r14,28
	add	r12,r13
	add	rdx,r15

	add	r11,r12
	add	rdx,r12
	lea	rdi,[1+rdi]
	add	rdx,r14

	mov	r13,QWORD[112+rsp]
	mov	r14,QWORD[88+rsp]
	mov	r12,r13
	mov	r15,r14

	ror	r12,7
	xor	r12,r13
	shr	r13,7

	ror	r12,1
	xor	r13,r12
	mov	r12,QWORD[48+rsp]

	ror	r15,42
	xor	r15,r14
	shr	r14,6

	ror	r15,19
	add	r12,r13
	xor	r14,r15

	add	r12,QWORD[104+rsp]
	mov	r13,r11
	add	r12,r14
	mov	r14,rdx
	ror	r13,23
	mov	r15,rax
	mov	QWORD[104+rsp],r12

	ror	r14,5
	xor	r13,r11
	xor	r15,rbx

	ror	r13,4
	add	r12,rcx
	xor	r14,rdx

	add	r12,QWORD[rdi*8+rbp]
	and	r15,r11
	mov	rcx,r8

	ror	r14,6
	xor	r13,r11
	xor	r15,rbx

	xor	rcx,r9
	xor	r14,rdx
	add	r12,r15
	mov	r15,r8

	ror	r13,14
	and	rcx,rdx
	and	r15,r9

	ror	r14,28
	add	r12,r13
	add	rcx,r15

	add	r10,r12
	add	rcx,r12
	lea	rdi,[1+rdi]
	add	rcx,r14

	mov	r13,QWORD[120+rsp]
	mov	r14,QWORD[96+rsp]
	mov	r12,r13
	mov	r15,r14

	ror	r12,7
	xor	r12,r13
	shr	r13,7

	ror	r12,1
	xor	r13,r12
	mov	r12,QWORD[56+rsp]

	ror	r15,42
	xor	r15,r14
	shr	r14,6

	ror	r15,19
	add	r12,r13
	xor	r14,r15

	add	r12,QWORD[112+rsp]
	mov	r13,r10
	add	r12,r14
	mov	r14,rcx
	ror	r13,23
	mov	r15,r11
	mov	QWORD[112+rsp],r12

	ror	r14,5
	xor	r13,r10
	xor	r15,rax

	ror	r13,4
	add	r12,rbx
	xor	r14,rcx

	add	r12,QWORD[rdi*8+rbp]
	and	r15,r10
	mov	rbx,rdx

	ror	r14,6
	xor	r13,r10
	xor	r15,rax

	xor	rbx,r8
	xor	r14,rcx
	add	r12,r15
	mov	r15,rdx

	ror	r13,14
	and	rbx,rcx
	and	r15,r8

	ror	r14,28
	add	r12,r13
	add	rbx,r15

	add	r9,r12
	add	rbx,r12
	lea	rdi,[1+rdi]
	add	rbx,r14

	mov	r13,QWORD[rsp]
	mov	r14,QWORD[104+rsp]
	mov	r12,r13
	mov	r15,r14

	ror	r12,7
	xor	r12,r13
	shr	r13,7

	ror	r12,1
	xor	r13,r12
	mov	r12,QWORD[64+rsp]

	ror	r15,42
	xor	r15,r14
	shr	r14,6

	ror	r15,19
	add	r12,r13
	xor	r14,r15

	add	r12,QWORD[120+rsp]
	mov	r13,r9
	add	r12,r14
	mov	r14,rbx
	ror	r13,23
	mov	r15,r10
	mov	QWORD[120+rsp],r12

	ror	r14,5
	xor	r13,r9
	xor	r15,r11

	ror	r13,4
	add	r12,rax
	xor	r14,rbx

	add	r12,QWORD[rdi*8+rbp]
	and	r15,r9
	mov	rax,rcx

	ror	r14,6
	xor	r13,r9
	xor	r15,r11

	xor	rax,rdx
	xor	r14,rbx
	add	r12,r15
	mov	r15,rcx

	ror	r13,14
	and	rax,rbx
	and	r15,rdx

	ror	r14,28
	add	r12,r13
	add	rax,r15

	add	r8,r12
	add	rax,r12
	lea	rdi,[1+rdi]
	add	rax,r14

	cmp	rdi,80
	jb	NEAR $L$rounds_16_xx

	mov	rdi,QWORD[((128+0))+rsp]
	lea	rsi,[128+rsi]

	add	rax,QWORD[rdi]
	add	rbx,QWORD[8+rdi]
	add	rcx,QWORD[16+rdi]
	add	rdx,QWORD[24+rdi]
	add	r8,QWORD[32+rdi]
	add	r9,QWORD[40+rdi]
	add	r10,QWORD[48+rdi]
	add	r11,QWORD[56+rdi]

	cmp	rsi,QWORD[((128+16))+rsp]

	mov	QWORD[rdi],rax
	mov	QWORD[8+rdi],rbx
	mov	QWORD[16+rdi],rcx
	mov	QWORD[24+rdi],rdx
	mov	QWORD[32+rdi],r8
	mov	QWORD[40+rdi],r9
	mov	QWORD[48+rdi],r10
	mov	QWORD[56+rdi],r11
	jb	NEAR $L$loop

	mov	rsi,QWORD[((128+24))+rsp]
	mov	r15,QWORD[rsi]
	mov	r14,QWORD[8+rsi]
	mov	r13,QWORD[16+rsi]
	mov	r12,QWORD[24+rsi]
	mov	rbp,QWORD[32+rsi]
	mov	rbx,QWORD[40+rsi]
	lea	rsp,[48+rsi]
$L$epilogue:
	mov	rdi,QWORD[8+rsp]	;WIN64 epilogue
	mov	rsi,QWORD[16+rsp]
	DB	0F3h,0C3h		;repret
$L$SEH_end_sha512_block_data_order:
ALIGN	64

K512:
	DQ	0x428a2f98d728ae22,0x7137449123ef65cd
	DQ	0xb5c0fbcfec4d3b2f,0xe9b5dba58189dbbc
	DQ	0x3956c25bf348b538,0x59f111f1b605d019
	DQ	0x923f82a4af194f9b,0xab1c5ed5da6d8118
	DQ	0xd807aa98a3030242,0x12835b0145706fbe
	DQ	0x243185be4ee4b28c,0x550c7dc3d5ffb4e2
	DQ	0x72be5d74f27b896f,0x80deb1fe3b1696b1
	DQ	0x9bdc06a725c71235,0xc19bf174cf692694
	DQ	0xe49b69c19ef14ad2,0xefbe4786384f25e3
	DQ	0x0fc19dc68b8cd5b5,0x240ca1cc77ac9c65
	DQ	0x2de92c6f592b0275,0x4a7484aa6ea6e483
	DQ	0x5cb0a9dcbd41fbd4,0x76f988da831153b5
	DQ	0x983e5152ee66dfab,0xa831c66d2db43210
	DQ	0xb00327c898fb213f,0xbf597fc7beef0ee4
	DQ	0xc6e00bf33da88fc2,0xd5a79147930aa725
	DQ	0x06ca6351e003826f,0x142929670a0e6e70
	DQ	0x27b70a8546d22ffc,0x2e1b21385c26c926
	DQ	0x4d2c6dfc5ac42aed,0x53380d139d95b3df
	DQ	0x650a73548baf63de,0x766a0abb3c77b2a8
	DQ	0x81c2c92e47edaee6,0x92722c851482353b
	DQ	0xa2bfe8a14cf10364,0xa81a664bbc423001
	DQ	0xc24b8b70d0f89791,0xc76c51a30654be30
	DQ	0xd192e819d6ef5218,0xd69906245565a910
	DQ	0xf40e35855771202a,0x106aa07032bbd1b8
	DQ	0x19a4c116b8d2d0c8,0x1e376c085141ab53
	DQ	0x2748774cdf8eeb99,0x34b0bcb5e19b48a8
	DQ	0x391c0cb3c5c95a63,0x4ed8aa4ae3418acb
	DQ	0x5b9cca4f7763e373,0x682e6ff3d6b2b8a3
	DQ	0x748f82ee5defb2fc,0x78a5636f43172f60
	DQ	0x84c87814a1f0ab72,0x8cc702081a6439ec
	DQ	0x90befffa23631e28,0xa4506cebde82bde9
	DQ	0xbef9a3f7b2c67915,0xc67178f2e372532b
	DQ	0xca273eceea26619c,0xd186b8c721c0c207
	DQ	0xeada7dd6cde0eb1e,0xf57d4f7fee6ed178
	DQ	0x06f067aa72176fba,0x0a637dc5a2c898a6
	DQ	0x113f9804bef90dae,0x1b710b35131c471b
	DQ	0x28db77f523047d84,0x32caab7b40c72493
	DQ	0x3c9ebe0a15c9bebc,0x431d67c49c100d4c
	DQ	0x4cc5d4becb3e42b6,0x597f299cfc657e2a
	DQ	0x5fcb6fab3ad6faec,0x6c44198c4a475817
EXTERN	__imp_RtlVirtualUnwind

ALIGN	16
se_handler:
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

	lea	r10,[$L$prologue]
	cmp	rbx,r10
	jb	NEAR $L$in_prologue

	mov	rax,QWORD[152+r8]

	lea	r10,[$L$epilogue]
	cmp	rbx,r10
	jae	NEAR $L$in_prologue

	mov	rax,QWORD[((128+24))+rax]
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

$L$in_prologue:
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
	DD	$L$SEH_begin_sha512_block_data_order wrt ..imagebase
	DD	$L$SEH_end_sha512_block_data_order wrt ..imagebase
	DD	$L$SEH_info_sha512_block_data_order wrt ..imagebase

section	.xdata rdata align=8
ALIGN	8
$L$SEH_info_sha512_block_data_order:
DB	9,0,0,0
	DD	se_handler wrt ..imagebase
