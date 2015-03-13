default	rel
%define XMMWORD
section	.text code align=64


global	sha256_block_data_order

ALIGN	16
sha256_block_data_order:
	mov	QWORD[8+rsp],rdi	;WIN64 prologue
	mov	QWORD[16+rsp],rsi
	mov	rax,rsp
$L$SEH_begin_sha256_block_data_order:
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
	sub	rsp,16*4+4*8
	lea	rdx,[rdx*4+rsi]
	and	rsp,-64
	mov	QWORD[((64+0))+rsp],rdi
	mov	QWORD[((64+8))+rsp],rsi
	mov	QWORD[((64+16))+rsp],rdx
	mov	QWORD[((64+24))+rsp],r11
$L$prologue:

	lea	rbp,[K256]

	mov	eax,DWORD[rdi]
	mov	ebx,DWORD[4+rdi]
	mov	ecx,DWORD[8+rdi]
	mov	edx,DWORD[12+rdi]
	mov	r8d,DWORD[16+rdi]
	mov	r9d,DWORD[20+rdi]
	mov	r10d,DWORD[24+rdi]
	mov	r11d,DWORD[28+rdi]
	jmp	NEAR $L$loop

ALIGN	16
$L$loop:
	xor	rdi,rdi
	mov	r12d,DWORD[rsi]
	mov	r13d,r8d
	mov	r14d,eax
	bswap	r12d
	ror	r13d,14
	mov	r15d,r9d
	mov	DWORD[rsp],r12d

	ror	r14d,9
	xor	r13d,r8d
	xor	r15d,r10d

	ror	r13d,5
	add	r12d,r11d
	xor	r14d,eax

	add	r12d,DWORD[rdi*4+rbp]
	and	r15d,r8d
	mov	r11d,ebx

	ror	r14d,11
	xor	r13d,r8d
	xor	r15d,r10d

	xor	r11d,ecx
	xor	r14d,eax
	add	r12d,r15d
	mov	r15d,ebx

	ror	r13d,6
	and	r11d,eax
	and	r15d,ecx

	ror	r14d,2
	add	r12d,r13d
	add	r11d,r15d

	add	edx,r12d
	add	r11d,r12d
	lea	rdi,[1+rdi]
	add	r11d,r14d

	mov	r12d,DWORD[4+rsi]
	mov	r13d,edx
	mov	r14d,r11d
	bswap	r12d
	ror	r13d,14
	mov	r15d,r8d
	mov	DWORD[4+rsp],r12d

	ror	r14d,9
	xor	r13d,edx
	xor	r15d,r9d

	ror	r13d,5
	add	r12d,r10d
	xor	r14d,r11d

	add	r12d,DWORD[rdi*4+rbp]
	and	r15d,edx
	mov	r10d,eax

	ror	r14d,11
	xor	r13d,edx
	xor	r15d,r9d

	xor	r10d,ebx
	xor	r14d,r11d
	add	r12d,r15d
	mov	r15d,eax

	ror	r13d,6
	and	r10d,r11d
	and	r15d,ebx

	ror	r14d,2
	add	r12d,r13d
	add	r10d,r15d

	add	ecx,r12d
	add	r10d,r12d
	lea	rdi,[1+rdi]
	add	r10d,r14d

	mov	r12d,DWORD[8+rsi]
	mov	r13d,ecx
	mov	r14d,r10d
	bswap	r12d
	ror	r13d,14
	mov	r15d,edx
	mov	DWORD[8+rsp],r12d

	ror	r14d,9
	xor	r13d,ecx
	xor	r15d,r8d

	ror	r13d,5
	add	r12d,r9d
	xor	r14d,r10d

	add	r12d,DWORD[rdi*4+rbp]
	and	r15d,ecx
	mov	r9d,r11d

	ror	r14d,11
	xor	r13d,ecx
	xor	r15d,r8d

	xor	r9d,eax
	xor	r14d,r10d
	add	r12d,r15d
	mov	r15d,r11d

	ror	r13d,6
	and	r9d,r10d
	and	r15d,eax

	ror	r14d,2
	add	r12d,r13d
	add	r9d,r15d

	add	ebx,r12d
	add	r9d,r12d
	lea	rdi,[1+rdi]
	add	r9d,r14d

	mov	r12d,DWORD[12+rsi]
	mov	r13d,ebx
	mov	r14d,r9d
	bswap	r12d
	ror	r13d,14
	mov	r15d,ecx
	mov	DWORD[12+rsp],r12d

	ror	r14d,9
	xor	r13d,ebx
	xor	r15d,edx

	ror	r13d,5
	add	r12d,r8d
	xor	r14d,r9d

	add	r12d,DWORD[rdi*4+rbp]
	and	r15d,ebx
	mov	r8d,r10d

	ror	r14d,11
	xor	r13d,ebx
	xor	r15d,edx

	xor	r8d,r11d
	xor	r14d,r9d
	add	r12d,r15d
	mov	r15d,r10d

	ror	r13d,6
	and	r8d,r9d
	and	r15d,r11d

	ror	r14d,2
	add	r12d,r13d
	add	r8d,r15d

	add	eax,r12d
	add	r8d,r12d
	lea	rdi,[1+rdi]
	add	r8d,r14d

	mov	r12d,DWORD[16+rsi]
	mov	r13d,eax
	mov	r14d,r8d
	bswap	r12d
	ror	r13d,14
	mov	r15d,ebx
	mov	DWORD[16+rsp],r12d

	ror	r14d,9
	xor	r13d,eax
	xor	r15d,ecx

	ror	r13d,5
	add	r12d,edx
	xor	r14d,r8d

	add	r12d,DWORD[rdi*4+rbp]
	and	r15d,eax
	mov	edx,r9d

	ror	r14d,11
	xor	r13d,eax
	xor	r15d,ecx

	xor	edx,r10d
	xor	r14d,r8d
	add	r12d,r15d
	mov	r15d,r9d

	ror	r13d,6
	and	edx,r8d
	and	r15d,r10d

	ror	r14d,2
	add	r12d,r13d
	add	edx,r15d

	add	r11d,r12d
	add	edx,r12d
	lea	rdi,[1+rdi]
	add	edx,r14d

	mov	r12d,DWORD[20+rsi]
	mov	r13d,r11d
	mov	r14d,edx
	bswap	r12d
	ror	r13d,14
	mov	r15d,eax
	mov	DWORD[20+rsp],r12d

	ror	r14d,9
	xor	r13d,r11d
	xor	r15d,ebx

	ror	r13d,5
	add	r12d,ecx
	xor	r14d,edx

	add	r12d,DWORD[rdi*4+rbp]
	and	r15d,r11d
	mov	ecx,r8d

	ror	r14d,11
	xor	r13d,r11d
	xor	r15d,ebx

	xor	ecx,r9d
	xor	r14d,edx
	add	r12d,r15d
	mov	r15d,r8d

	ror	r13d,6
	and	ecx,edx
	and	r15d,r9d

	ror	r14d,2
	add	r12d,r13d
	add	ecx,r15d

	add	r10d,r12d
	add	ecx,r12d
	lea	rdi,[1+rdi]
	add	ecx,r14d

	mov	r12d,DWORD[24+rsi]
	mov	r13d,r10d
	mov	r14d,ecx
	bswap	r12d
	ror	r13d,14
	mov	r15d,r11d
	mov	DWORD[24+rsp],r12d

	ror	r14d,9
	xor	r13d,r10d
	xor	r15d,eax

	ror	r13d,5
	add	r12d,ebx
	xor	r14d,ecx

	add	r12d,DWORD[rdi*4+rbp]
	and	r15d,r10d
	mov	ebx,edx

	ror	r14d,11
	xor	r13d,r10d
	xor	r15d,eax

	xor	ebx,r8d
	xor	r14d,ecx
	add	r12d,r15d
	mov	r15d,edx

	ror	r13d,6
	and	ebx,ecx
	and	r15d,r8d

	ror	r14d,2
	add	r12d,r13d
	add	ebx,r15d

	add	r9d,r12d
	add	ebx,r12d
	lea	rdi,[1+rdi]
	add	ebx,r14d

	mov	r12d,DWORD[28+rsi]
	mov	r13d,r9d
	mov	r14d,ebx
	bswap	r12d
	ror	r13d,14
	mov	r15d,r10d
	mov	DWORD[28+rsp],r12d

	ror	r14d,9
	xor	r13d,r9d
	xor	r15d,r11d

	ror	r13d,5
	add	r12d,eax
	xor	r14d,ebx

	add	r12d,DWORD[rdi*4+rbp]
	and	r15d,r9d
	mov	eax,ecx

	ror	r14d,11
	xor	r13d,r9d
	xor	r15d,r11d

	xor	eax,edx
	xor	r14d,ebx
	add	r12d,r15d
	mov	r15d,ecx

	ror	r13d,6
	and	eax,ebx
	and	r15d,edx

	ror	r14d,2
	add	r12d,r13d
	add	eax,r15d

	add	r8d,r12d
	add	eax,r12d
	lea	rdi,[1+rdi]
	add	eax,r14d

	mov	r12d,DWORD[32+rsi]
	mov	r13d,r8d
	mov	r14d,eax
	bswap	r12d
	ror	r13d,14
	mov	r15d,r9d
	mov	DWORD[32+rsp],r12d

	ror	r14d,9
	xor	r13d,r8d
	xor	r15d,r10d

	ror	r13d,5
	add	r12d,r11d
	xor	r14d,eax

	add	r12d,DWORD[rdi*4+rbp]
	and	r15d,r8d
	mov	r11d,ebx

	ror	r14d,11
	xor	r13d,r8d
	xor	r15d,r10d

	xor	r11d,ecx
	xor	r14d,eax
	add	r12d,r15d
	mov	r15d,ebx

	ror	r13d,6
	and	r11d,eax
	and	r15d,ecx

	ror	r14d,2
	add	r12d,r13d
	add	r11d,r15d

	add	edx,r12d
	add	r11d,r12d
	lea	rdi,[1+rdi]
	add	r11d,r14d

	mov	r12d,DWORD[36+rsi]
	mov	r13d,edx
	mov	r14d,r11d
	bswap	r12d
	ror	r13d,14
	mov	r15d,r8d
	mov	DWORD[36+rsp],r12d

	ror	r14d,9
	xor	r13d,edx
	xor	r15d,r9d

	ror	r13d,5
	add	r12d,r10d
	xor	r14d,r11d

	add	r12d,DWORD[rdi*4+rbp]
	and	r15d,edx
	mov	r10d,eax

	ror	r14d,11
	xor	r13d,edx
	xor	r15d,r9d

	xor	r10d,ebx
	xor	r14d,r11d
	add	r12d,r15d
	mov	r15d,eax

	ror	r13d,6
	and	r10d,r11d
	and	r15d,ebx

	ror	r14d,2
	add	r12d,r13d
	add	r10d,r15d

	add	ecx,r12d
	add	r10d,r12d
	lea	rdi,[1+rdi]
	add	r10d,r14d

	mov	r12d,DWORD[40+rsi]
	mov	r13d,ecx
	mov	r14d,r10d
	bswap	r12d
	ror	r13d,14
	mov	r15d,edx
	mov	DWORD[40+rsp],r12d

	ror	r14d,9
	xor	r13d,ecx
	xor	r15d,r8d

	ror	r13d,5
	add	r12d,r9d
	xor	r14d,r10d

	add	r12d,DWORD[rdi*4+rbp]
	and	r15d,ecx
	mov	r9d,r11d

	ror	r14d,11
	xor	r13d,ecx
	xor	r15d,r8d

	xor	r9d,eax
	xor	r14d,r10d
	add	r12d,r15d
	mov	r15d,r11d

	ror	r13d,6
	and	r9d,r10d
	and	r15d,eax

	ror	r14d,2
	add	r12d,r13d
	add	r9d,r15d

	add	ebx,r12d
	add	r9d,r12d
	lea	rdi,[1+rdi]
	add	r9d,r14d

	mov	r12d,DWORD[44+rsi]
	mov	r13d,ebx
	mov	r14d,r9d
	bswap	r12d
	ror	r13d,14
	mov	r15d,ecx
	mov	DWORD[44+rsp],r12d

	ror	r14d,9
	xor	r13d,ebx
	xor	r15d,edx

	ror	r13d,5
	add	r12d,r8d
	xor	r14d,r9d

	add	r12d,DWORD[rdi*4+rbp]
	and	r15d,ebx
	mov	r8d,r10d

	ror	r14d,11
	xor	r13d,ebx
	xor	r15d,edx

	xor	r8d,r11d
	xor	r14d,r9d
	add	r12d,r15d
	mov	r15d,r10d

	ror	r13d,6
	and	r8d,r9d
	and	r15d,r11d

	ror	r14d,2
	add	r12d,r13d
	add	r8d,r15d

	add	eax,r12d
	add	r8d,r12d
	lea	rdi,[1+rdi]
	add	r8d,r14d

	mov	r12d,DWORD[48+rsi]
	mov	r13d,eax
	mov	r14d,r8d
	bswap	r12d
	ror	r13d,14
	mov	r15d,ebx
	mov	DWORD[48+rsp],r12d

	ror	r14d,9
	xor	r13d,eax
	xor	r15d,ecx

	ror	r13d,5
	add	r12d,edx
	xor	r14d,r8d

	add	r12d,DWORD[rdi*4+rbp]
	and	r15d,eax
	mov	edx,r9d

	ror	r14d,11
	xor	r13d,eax
	xor	r15d,ecx

	xor	edx,r10d
	xor	r14d,r8d
	add	r12d,r15d
	mov	r15d,r9d

	ror	r13d,6
	and	edx,r8d
	and	r15d,r10d

	ror	r14d,2
	add	r12d,r13d
	add	edx,r15d

	add	r11d,r12d
	add	edx,r12d
	lea	rdi,[1+rdi]
	add	edx,r14d

	mov	r12d,DWORD[52+rsi]
	mov	r13d,r11d
	mov	r14d,edx
	bswap	r12d
	ror	r13d,14
	mov	r15d,eax
	mov	DWORD[52+rsp],r12d

	ror	r14d,9
	xor	r13d,r11d
	xor	r15d,ebx

	ror	r13d,5
	add	r12d,ecx
	xor	r14d,edx

	add	r12d,DWORD[rdi*4+rbp]
	and	r15d,r11d
	mov	ecx,r8d

	ror	r14d,11
	xor	r13d,r11d
	xor	r15d,ebx

	xor	ecx,r9d
	xor	r14d,edx
	add	r12d,r15d
	mov	r15d,r8d

	ror	r13d,6
	and	ecx,edx
	and	r15d,r9d

	ror	r14d,2
	add	r12d,r13d
	add	ecx,r15d

	add	r10d,r12d
	add	ecx,r12d
	lea	rdi,[1+rdi]
	add	ecx,r14d

	mov	r12d,DWORD[56+rsi]
	mov	r13d,r10d
	mov	r14d,ecx
	bswap	r12d
	ror	r13d,14
	mov	r15d,r11d
	mov	DWORD[56+rsp],r12d

	ror	r14d,9
	xor	r13d,r10d
	xor	r15d,eax

	ror	r13d,5
	add	r12d,ebx
	xor	r14d,ecx

	add	r12d,DWORD[rdi*4+rbp]
	and	r15d,r10d
	mov	ebx,edx

	ror	r14d,11
	xor	r13d,r10d
	xor	r15d,eax

	xor	ebx,r8d
	xor	r14d,ecx
	add	r12d,r15d
	mov	r15d,edx

	ror	r13d,6
	and	ebx,ecx
	and	r15d,r8d

	ror	r14d,2
	add	r12d,r13d
	add	ebx,r15d

	add	r9d,r12d
	add	ebx,r12d
	lea	rdi,[1+rdi]
	add	ebx,r14d

	mov	r12d,DWORD[60+rsi]
	mov	r13d,r9d
	mov	r14d,ebx
	bswap	r12d
	ror	r13d,14
	mov	r15d,r10d
	mov	DWORD[60+rsp],r12d

	ror	r14d,9
	xor	r13d,r9d
	xor	r15d,r11d

	ror	r13d,5
	add	r12d,eax
	xor	r14d,ebx

	add	r12d,DWORD[rdi*4+rbp]
	and	r15d,r9d
	mov	eax,ecx

	ror	r14d,11
	xor	r13d,r9d
	xor	r15d,r11d

	xor	eax,edx
	xor	r14d,ebx
	add	r12d,r15d
	mov	r15d,ecx

	ror	r13d,6
	and	eax,ebx
	and	r15d,edx

	ror	r14d,2
	add	r12d,r13d
	add	eax,r15d

	add	r8d,r12d
	add	eax,r12d
	lea	rdi,[1+rdi]
	add	eax,r14d

	jmp	NEAR $L$rounds_16_xx
ALIGN	16
$L$rounds_16_xx:
	mov	r13d,DWORD[4+rsp]
	mov	r14d,DWORD[56+rsp]
	mov	r12d,r13d
	mov	r15d,r14d

	ror	r12d,11
	xor	r12d,r13d
	shr	r13d,3

	ror	r12d,7
	xor	r13d,r12d
	mov	r12d,DWORD[36+rsp]

	ror	r15d,2
	xor	r15d,r14d
	shr	r14d,10

	ror	r15d,17
	add	r12d,r13d
	xor	r14d,r15d

	add	r12d,DWORD[rsp]
	mov	r13d,r8d
	add	r12d,r14d
	mov	r14d,eax
	ror	r13d,14
	mov	r15d,r9d
	mov	DWORD[rsp],r12d

	ror	r14d,9
	xor	r13d,r8d
	xor	r15d,r10d

	ror	r13d,5
	add	r12d,r11d
	xor	r14d,eax

	add	r12d,DWORD[rdi*4+rbp]
	and	r15d,r8d
	mov	r11d,ebx

	ror	r14d,11
	xor	r13d,r8d
	xor	r15d,r10d

	xor	r11d,ecx
	xor	r14d,eax
	add	r12d,r15d
	mov	r15d,ebx

	ror	r13d,6
	and	r11d,eax
	and	r15d,ecx

	ror	r14d,2
	add	r12d,r13d
	add	r11d,r15d

	add	edx,r12d
	add	r11d,r12d
	lea	rdi,[1+rdi]
	add	r11d,r14d

	mov	r13d,DWORD[8+rsp]
	mov	r14d,DWORD[60+rsp]
	mov	r12d,r13d
	mov	r15d,r14d

	ror	r12d,11
	xor	r12d,r13d
	shr	r13d,3

	ror	r12d,7
	xor	r13d,r12d
	mov	r12d,DWORD[40+rsp]

	ror	r15d,2
	xor	r15d,r14d
	shr	r14d,10

	ror	r15d,17
	add	r12d,r13d
	xor	r14d,r15d

	add	r12d,DWORD[4+rsp]
	mov	r13d,edx
	add	r12d,r14d
	mov	r14d,r11d
	ror	r13d,14
	mov	r15d,r8d
	mov	DWORD[4+rsp],r12d

	ror	r14d,9
	xor	r13d,edx
	xor	r15d,r9d

	ror	r13d,5
	add	r12d,r10d
	xor	r14d,r11d

	add	r12d,DWORD[rdi*4+rbp]
	and	r15d,edx
	mov	r10d,eax

	ror	r14d,11
	xor	r13d,edx
	xor	r15d,r9d

	xor	r10d,ebx
	xor	r14d,r11d
	add	r12d,r15d
	mov	r15d,eax

	ror	r13d,6
	and	r10d,r11d
	and	r15d,ebx

	ror	r14d,2
	add	r12d,r13d
	add	r10d,r15d

	add	ecx,r12d
	add	r10d,r12d
	lea	rdi,[1+rdi]
	add	r10d,r14d

	mov	r13d,DWORD[12+rsp]
	mov	r14d,DWORD[rsp]
	mov	r12d,r13d
	mov	r15d,r14d

	ror	r12d,11
	xor	r12d,r13d
	shr	r13d,3

	ror	r12d,7
	xor	r13d,r12d
	mov	r12d,DWORD[44+rsp]

	ror	r15d,2
	xor	r15d,r14d
	shr	r14d,10

	ror	r15d,17
	add	r12d,r13d
	xor	r14d,r15d

	add	r12d,DWORD[8+rsp]
	mov	r13d,ecx
	add	r12d,r14d
	mov	r14d,r10d
	ror	r13d,14
	mov	r15d,edx
	mov	DWORD[8+rsp],r12d

	ror	r14d,9
	xor	r13d,ecx
	xor	r15d,r8d

	ror	r13d,5
	add	r12d,r9d
	xor	r14d,r10d

	add	r12d,DWORD[rdi*4+rbp]
	and	r15d,ecx
	mov	r9d,r11d

	ror	r14d,11
	xor	r13d,ecx
	xor	r15d,r8d

	xor	r9d,eax
	xor	r14d,r10d
	add	r12d,r15d
	mov	r15d,r11d

	ror	r13d,6
	and	r9d,r10d
	and	r15d,eax

	ror	r14d,2
	add	r12d,r13d
	add	r9d,r15d

	add	ebx,r12d
	add	r9d,r12d
	lea	rdi,[1+rdi]
	add	r9d,r14d

	mov	r13d,DWORD[16+rsp]
	mov	r14d,DWORD[4+rsp]
	mov	r12d,r13d
	mov	r15d,r14d

	ror	r12d,11
	xor	r12d,r13d
	shr	r13d,3

	ror	r12d,7
	xor	r13d,r12d
	mov	r12d,DWORD[48+rsp]

	ror	r15d,2
	xor	r15d,r14d
	shr	r14d,10

	ror	r15d,17
	add	r12d,r13d
	xor	r14d,r15d

	add	r12d,DWORD[12+rsp]
	mov	r13d,ebx
	add	r12d,r14d
	mov	r14d,r9d
	ror	r13d,14
	mov	r15d,ecx
	mov	DWORD[12+rsp],r12d

	ror	r14d,9
	xor	r13d,ebx
	xor	r15d,edx

	ror	r13d,5
	add	r12d,r8d
	xor	r14d,r9d

	add	r12d,DWORD[rdi*4+rbp]
	and	r15d,ebx
	mov	r8d,r10d

	ror	r14d,11
	xor	r13d,ebx
	xor	r15d,edx

	xor	r8d,r11d
	xor	r14d,r9d
	add	r12d,r15d
	mov	r15d,r10d

	ror	r13d,6
	and	r8d,r9d
	and	r15d,r11d

	ror	r14d,2
	add	r12d,r13d
	add	r8d,r15d

	add	eax,r12d
	add	r8d,r12d
	lea	rdi,[1+rdi]
	add	r8d,r14d

	mov	r13d,DWORD[20+rsp]
	mov	r14d,DWORD[8+rsp]
	mov	r12d,r13d
	mov	r15d,r14d

	ror	r12d,11
	xor	r12d,r13d
	shr	r13d,3

	ror	r12d,7
	xor	r13d,r12d
	mov	r12d,DWORD[52+rsp]

	ror	r15d,2
	xor	r15d,r14d
	shr	r14d,10

	ror	r15d,17
	add	r12d,r13d
	xor	r14d,r15d

	add	r12d,DWORD[16+rsp]
	mov	r13d,eax
	add	r12d,r14d
	mov	r14d,r8d
	ror	r13d,14
	mov	r15d,ebx
	mov	DWORD[16+rsp],r12d

	ror	r14d,9
	xor	r13d,eax
	xor	r15d,ecx

	ror	r13d,5
	add	r12d,edx
	xor	r14d,r8d

	add	r12d,DWORD[rdi*4+rbp]
	and	r15d,eax
	mov	edx,r9d

	ror	r14d,11
	xor	r13d,eax
	xor	r15d,ecx

	xor	edx,r10d
	xor	r14d,r8d
	add	r12d,r15d
	mov	r15d,r9d

	ror	r13d,6
	and	edx,r8d
	and	r15d,r10d

	ror	r14d,2
	add	r12d,r13d
	add	edx,r15d

	add	r11d,r12d
	add	edx,r12d
	lea	rdi,[1+rdi]
	add	edx,r14d

	mov	r13d,DWORD[24+rsp]
	mov	r14d,DWORD[12+rsp]
	mov	r12d,r13d
	mov	r15d,r14d

	ror	r12d,11
	xor	r12d,r13d
	shr	r13d,3

	ror	r12d,7
	xor	r13d,r12d
	mov	r12d,DWORD[56+rsp]

	ror	r15d,2
	xor	r15d,r14d
	shr	r14d,10

	ror	r15d,17
	add	r12d,r13d
	xor	r14d,r15d

	add	r12d,DWORD[20+rsp]
	mov	r13d,r11d
	add	r12d,r14d
	mov	r14d,edx
	ror	r13d,14
	mov	r15d,eax
	mov	DWORD[20+rsp],r12d

	ror	r14d,9
	xor	r13d,r11d
	xor	r15d,ebx

	ror	r13d,5
	add	r12d,ecx
	xor	r14d,edx

	add	r12d,DWORD[rdi*4+rbp]
	and	r15d,r11d
	mov	ecx,r8d

	ror	r14d,11
	xor	r13d,r11d
	xor	r15d,ebx

	xor	ecx,r9d
	xor	r14d,edx
	add	r12d,r15d
	mov	r15d,r8d

	ror	r13d,6
	and	ecx,edx
	and	r15d,r9d

	ror	r14d,2
	add	r12d,r13d
	add	ecx,r15d

	add	r10d,r12d
	add	ecx,r12d
	lea	rdi,[1+rdi]
	add	ecx,r14d

	mov	r13d,DWORD[28+rsp]
	mov	r14d,DWORD[16+rsp]
	mov	r12d,r13d
	mov	r15d,r14d

	ror	r12d,11
	xor	r12d,r13d
	shr	r13d,3

	ror	r12d,7
	xor	r13d,r12d
	mov	r12d,DWORD[60+rsp]

	ror	r15d,2
	xor	r15d,r14d
	shr	r14d,10

	ror	r15d,17
	add	r12d,r13d
	xor	r14d,r15d

	add	r12d,DWORD[24+rsp]
	mov	r13d,r10d
	add	r12d,r14d
	mov	r14d,ecx
	ror	r13d,14
	mov	r15d,r11d
	mov	DWORD[24+rsp],r12d

	ror	r14d,9
	xor	r13d,r10d
	xor	r15d,eax

	ror	r13d,5
	add	r12d,ebx
	xor	r14d,ecx

	add	r12d,DWORD[rdi*4+rbp]
	and	r15d,r10d
	mov	ebx,edx

	ror	r14d,11
	xor	r13d,r10d
	xor	r15d,eax

	xor	ebx,r8d
	xor	r14d,ecx
	add	r12d,r15d
	mov	r15d,edx

	ror	r13d,6
	and	ebx,ecx
	and	r15d,r8d

	ror	r14d,2
	add	r12d,r13d
	add	ebx,r15d

	add	r9d,r12d
	add	ebx,r12d
	lea	rdi,[1+rdi]
	add	ebx,r14d

	mov	r13d,DWORD[32+rsp]
	mov	r14d,DWORD[20+rsp]
	mov	r12d,r13d
	mov	r15d,r14d

	ror	r12d,11
	xor	r12d,r13d
	shr	r13d,3

	ror	r12d,7
	xor	r13d,r12d
	mov	r12d,DWORD[rsp]

	ror	r15d,2
	xor	r15d,r14d
	shr	r14d,10

	ror	r15d,17
	add	r12d,r13d
	xor	r14d,r15d

	add	r12d,DWORD[28+rsp]
	mov	r13d,r9d
	add	r12d,r14d
	mov	r14d,ebx
	ror	r13d,14
	mov	r15d,r10d
	mov	DWORD[28+rsp],r12d

	ror	r14d,9
	xor	r13d,r9d
	xor	r15d,r11d

	ror	r13d,5
	add	r12d,eax
	xor	r14d,ebx

	add	r12d,DWORD[rdi*4+rbp]
	and	r15d,r9d
	mov	eax,ecx

	ror	r14d,11
	xor	r13d,r9d
	xor	r15d,r11d

	xor	eax,edx
	xor	r14d,ebx
	add	r12d,r15d
	mov	r15d,ecx

	ror	r13d,6
	and	eax,ebx
	and	r15d,edx

	ror	r14d,2
	add	r12d,r13d
	add	eax,r15d

	add	r8d,r12d
	add	eax,r12d
	lea	rdi,[1+rdi]
	add	eax,r14d

	mov	r13d,DWORD[36+rsp]
	mov	r14d,DWORD[24+rsp]
	mov	r12d,r13d
	mov	r15d,r14d

	ror	r12d,11
	xor	r12d,r13d
	shr	r13d,3

	ror	r12d,7
	xor	r13d,r12d
	mov	r12d,DWORD[4+rsp]

	ror	r15d,2
	xor	r15d,r14d
	shr	r14d,10

	ror	r15d,17
	add	r12d,r13d
	xor	r14d,r15d

	add	r12d,DWORD[32+rsp]
	mov	r13d,r8d
	add	r12d,r14d
	mov	r14d,eax
	ror	r13d,14
	mov	r15d,r9d
	mov	DWORD[32+rsp],r12d

	ror	r14d,9
	xor	r13d,r8d
	xor	r15d,r10d

	ror	r13d,5
	add	r12d,r11d
	xor	r14d,eax

	add	r12d,DWORD[rdi*4+rbp]
	and	r15d,r8d
	mov	r11d,ebx

	ror	r14d,11
	xor	r13d,r8d
	xor	r15d,r10d

	xor	r11d,ecx
	xor	r14d,eax
	add	r12d,r15d
	mov	r15d,ebx

	ror	r13d,6
	and	r11d,eax
	and	r15d,ecx

	ror	r14d,2
	add	r12d,r13d
	add	r11d,r15d

	add	edx,r12d
	add	r11d,r12d
	lea	rdi,[1+rdi]
	add	r11d,r14d

	mov	r13d,DWORD[40+rsp]
	mov	r14d,DWORD[28+rsp]
	mov	r12d,r13d
	mov	r15d,r14d

	ror	r12d,11
	xor	r12d,r13d
	shr	r13d,3

	ror	r12d,7
	xor	r13d,r12d
	mov	r12d,DWORD[8+rsp]

	ror	r15d,2
	xor	r15d,r14d
	shr	r14d,10

	ror	r15d,17
	add	r12d,r13d
	xor	r14d,r15d

	add	r12d,DWORD[36+rsp]
	mov	r13d,edx
	add	r12d,r14d
	mov	r14d,r11d
	ror	r13d,14
	mov	r15d,r8d
	mov	DWORD[36+rsp],r12d

	ror	r14d,9
	xor	r13d,edx
	xor	r15d,r9d

	ror	r13d,5
	add	r12d,r10d
	xor	r14d,r11d

	add	r12d,DWORD[rdi*4+rbp]
	and	r15d,edx
	mov	r10d,eax

	ror	r14d,11
	xor	r13d,edx
	xor	r15d,r9d

	xor	r10d,ebx
	xor	r14d,r11d
	add	r12d,r15d
	mov	r15d,eax

	ror	r13d,6
	and	r10d,r11d
	and	r15d,ebx

	ror	r14d,2
	add	r12d,r13d
	add	r10d,r15d

	add	ecx,r12d
	add	r10d,r12d
	lea	rdi,[1+rdi]
	add	r10d,r14d

	mov	r13d,DWORD[44+rsp]
	mov	r14d,DWORD[32+rsp]
	mov	r12d,r13d
	mov	r15d,r14d

	ror	r12d,11
	xor	r12d,r13d
	shr	r13d,3

	ror	r12d,7
	xor	r13d,r12d
	mov	r12d,DWORD[12+rsp]

	ror	r15d,2
	xor	r15d,r14d
	shr	r14d,10

	ror	r15d,17
	add	r12d,r13d
	xor	r14d,r15d

	add	r12d,DWORD[40+rsp]
	mov	r13d,ecx
	add	r12d,r14d
	mov	r14d,r10d
	ror	r13d,14
	mov	r15d,edx
	mov	DWORD[40+rsp],r12d

	ror	r14d,9
	xor	r13d,ecx
	xor	r15d,r8d

	ror	r13d,5
	add	r12d,r9d
	xor	r14d,r10d

	add	r12d,DWORD[rdi*4+rbp]
	and	r15d,ecx
	mov	r9d,r11d

	ror	r14d,11
	xor	r13d,ecx
	xor	r15d,r8d

	xor	r9d,eax
	xor	r14d,r10d
	add	r12d,r15d
	mov	r15d,r11d

	ror	r13d,6
	and	r9d,r10d
	and	r15d,eax

	ror	r14d,2
	add	r12d,r13d
	add	r9d,r15d

	add	ebx,r12d
	add	r9d,r12d
	lea	rdi,[1+rdi]
	add	r9d,r14d

	mov	r13d,DWORD[48+rsp]
	mov	r14d,DWORD[36+rsp]
	mov	r12d,r13d
	mov	r15d,r14d

	ror	r12d,11
	xor	r12d,r13d
	shr	r13d,3

	ror	r12d,7
	xor	r13d,r12d
	mov	r12d,DWORD[16+rsp]

	ror	r15d,2
	xor	r15d,r14d
	shr	r14d,10

	ror	r15d,17
	add	r12d,r13d
	xor	r14d,r15d

	add	r12d,DWORD[44+rsp]
	mov	r13d,ebx
	add	r12d,r14d
	mov	r14d,r9d
	ror	r13d,14
	mov	r15d,ecx
	mov	DWORD[44+rsp],r12d

	ror	r14d,9
	xor	r13d,ebx
	xor	r15d,edx

	ror	r13d,5
	add	r12d,r8d
	xor	r14d,r9d

	add	r12d,DWORD[rdi*4+rbp]
	and	r15d,ebx
	mov	r8d,r10d

	ror	r14d,11
	xor	r13d,ebx
	xor	r15d,edx

	xor	r8d,r11d
	xor	r14d,r9d
	add	r12d,r15d
	mov	r15d,r10d

	ror	r13d,6
	and	r8d,r9d
	and	r15d,r11d

	ror	r14d,2
	add	r12d,r13d
	add	r8d,r15d

	add	eax,r12d
	add	r8d,r12d
	lea	rdi,[1+rdi]
	add	r8d,r14d

	mov	r13d,DWORD[52+rsp]
	mov	r14d,DWORD[40+rsp]
	mov	r12d,r13d
	mov	r15d,r14d

	ror	r12d,11
	xor	r12d,r13d
	shr	r13d,3

	ror	r12d,7
	xor	r13d,r12d
	mov	r12d,DWORD[20+rsp]

	ror	r15d,2
	xor	r15d,r14d
	shr	r14d,10

	ror	r15d,17
	add	r12d,r13d
	xor	r14d,r15d

	add	r12d,DWORD[48+rsp]
	mov	r13d,eax
	add	r12d,r14d
	mov	r14d,r8d
	ror	r13d,14
	mov	r15d,ebx
	mov	DWORD[48+rsp],r12d

	ror	r14d,9
	xor	r13d,eax
	xor	r15d,ecx

	ror	r13d,5
	add	r12d,edx
	xor	r14d,r8d

	add	r12d,DWORD[rdi*4+rbp]
	and	r15d,eax
	mov	edx,r9d

	ror	r14d,11
	xor	r13d,eax
	xor	r15d,ecx

	xor	edx,r10d
	xor	r14d,r8d
	add	r12d,r15d
	mov	r15d,r9d

	ror	r13d,6
	and	edx,r8d
	and	r15d,r10d

	ror	r14d,2
	add	r12d,r13d
	add	edx,r15d

	add	r11d,r12d
	add	edx,r12d
	lea	rdi,[1+rdi]
	add	edx,r14d

	mov	r13d,DWORD[56+rsp]
	mov	r14d,DWORD[44+rsp]
	mov	r12d,r13d
	mov	r15d,r14d

	ror	r12d,11
	xor	r12d,r13d
	shr	r13d,3

	ror	r12d,7
	xor	r13d,r12d
	mov	r12d,DWORD[24+rsp]

	ror	r15d,2
	xor	r15d,r14d
	shr	r14d,10

	ror	r15d,17
	add	r12d,r13d
	xor	r14d,r15d

	add	r12d,DWORD[52+rsp]
	mov	r13d,r11d
	add	r12d,r14d
	mov	r14d,edx
	ror	r13d,14
	mov	r15d,eax
	mov	DWORD[52+rsp],r12d

	ror	r14d,9
	xor	r13d,r11d
	xor	r15d,ebx

	ror	r13d,5
	add	r12d,ecx
	xor	r14d,edx

	add	r12d,DWORD[rdi*4+rbp]
	and	r15d,r11d
	mov	ecx,r8d

	ror	r14d,11
	xor	r13d,r11d
	xor	r15d,ebx

	xor	ecx,r9d
	xor	r14d,edx
	add	r12d,r15d
	mov	r15d,r8d

	ror	r13d,6
	and	ecx,edx
	and	r15d,r9d

	ror	r14d,2
	add	r12d,r13d
	add	ecx,r15d

	add	r10d,r12d
	add	ecx,r12d
	lea	rdi,[1+rdi]
	add	ecx,r14d

	mov	r13d,DWORD[60+rsp]
	mov	r14d,DWORD[48+rsp]
	mov	r12d,r13d
	mov	r15d,r14d

	ror	r12d,11
	xor	r12d,r13d
	shr	r13d,3

	ror	r12d,7
	xor	r13d,r12d
	mov	r12d,DWORD[28+rsp]

	ror	r15d,2
	xor	r15d,r14d
	shr	r14d,10

	ror	r15d,17
	add	r12d,r13d
	xor	r14d,r15d

	add	r12d,DWORD[56+rsp]
	mov	r13d,r10d
	add	r12d,r14d
	mov	r14d,ecx
	ror	r13d,14
	mov	r15d,r11d
	mov	DWORD[56+rsp],r12d

	ror	r14d,9
	xor	r13d,r10d
	xor	r15d,eax

	ror	r13d,5
	add	r12d,ebx
	xor	r14d,ecx

	add	r12d,DWORD[rdi*4+rbp]
	and	r15d,r10d
	mov	ebx,edx

	ror	r14d,11
	xor	r13d,r10d
	xor	r15d,eax

	xor	ebx,r8d
	xor	r14d,ecx
	add	r12d,r15d
	mov	r15d,edx

	ror	r13d,6
	and	ebx,ecx
	and	r15d,r8d

	ror	r14d,2
	add	r12d,r13d
	add	ebx,r15d

	add	r9d,r12d
	add	ebx,r12d
	lea	rdi,[1+rdi]
	add	ebx,r14d

	mov	r13d,DWORD[rsp]
	mov	r14d,DWORD[52+rsp]
	mov	r12d,r13d
	mov	r15d,r14d

	ror	r12d,11
	xor	r12d,r13d
	shr	r13d,3

	ror	r12d,7
	xor	r13d,r12d
	mov	r12d,DWORD[32+rsp]

	ror	r15d,2
	xor	r15d,r14d
	shr	r14d,10

	ror	r15d,17
	add	r12d,r13d
	xor	r14d,r15d

	add	r12d,DWORD[60+rsp]
	mov	r13d,r9d
	add	r12d,r14d
	mov	r14d,ebx
	ror	r13d,14
	mov	r15d,r10d
	mov	DWORD[60+rsp],r12d

	ror	r14d,9
	xor	r13d,r9d
	xor	r15d,r11d

	ror	r13d,5
	add	r12d,eax
	xor	r14d,ebx

	add	r12d,DWORD[rdi*4+rbp]
	and	r15d,r9d
	mov	eax,ecx

	ror	r14d,11
	xor	r13d,r9d
	xor	r15d,r11d

	xor	eax,edx
	xor	r14d,ebx
	add	r12d,r15d
	mov	r15d,ecx

	ror	r13d,6
	and	eax,ebx
	and	r15d,edx

	ror	r14d,2
	add	r12d,r13d
	add	eax,r15d

	add	r8d,r12d
	add	eax,r12d
	lea	rdi,[1+rdi]
	add	eax,r14d

	cmp	rdi,64
	jb	NEAR $L$rounds_16_xx

	mov	rdi,QWORD[((64+0))+rsp]
	lea	rsi,[64+rsi]

	add	eax,DWORD[rdi]
	add	ebx,DWORD[4+rdi]
	add	ecx,DWORD[8+rdi]
	add	edx,DWORD[12+rdi]
	add	r8d,DWORD[16+rdi]
	add	r9d,DWORD[20+rdi]
	add	r10d,DWORD[24+rdi]
	add	r11d,DWORD[28+rdi]

	cmp	rsi,QWORD[((64+16))+rsp]

	mov	DWORD[rdi],eax
	mov	DWORD[4+rdi],ebx
	mov	DWORD[8+rdi],ecx
	mov	DWORD[12+rdi],edx
	mov	DWORD[16+rdi],r8d
	mov	DWORD[20+rdi],r9d
	mov	DWORD[24+rdi],r10d
	mov	DWORD[28+rdi],r11d
	jb	NEAR $L$loop

	mov	rsi,QWORD[((64+24))+rsp]
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
$L$SEH_end_sha256_block_data_order:
ALIGN	64

K256:
	DD	0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5
	DD	0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5
	DD	0xd807aa98,0x12835b01,0x243185be,0x550c7dc3
	DD	0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174
	DD	0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc
	DD	0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da
	DD	0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7
	DD	0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967
	DD	0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13
	DD	0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85
	DD	0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3
	DD	0xd192e819,0xd6990624,0xf40e3585,0x106aa070
	DD	0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5
	DD	0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3
	DD	0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208
	DD	0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2
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

	mov	rax,QWORD[((64+24))+rax]
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
	DD	$L$SEH_begin_sha256_block_data_order wrt ..imagebase
	DD	$L$SEH_end_sha256_block_data_order wrt ..imagebase
	DD	$L$SEH_info_sha256_block_data_order wrt ..imagebase

section	.xdata rdata align=8
ALIGN	8
$L$SEH_info_sha256_block_data_order:
DB	9,0,0,0
	DD	se_handler wrt ..imagebase
