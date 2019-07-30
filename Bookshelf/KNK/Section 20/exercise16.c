#include <stdio.h>

typedef unsigned char BYTE;
typedef unsigned short WORD;
typedef unsigned long DWORD;

union
{
	struct
	{
		DWORD eax, ebx, ecx, edx;
	} dword;
	struct
	{
		WORD ax, dummy_ax, bx, dummy_bx, cx, dummy_cx, dx, dummy_dx;
	} word;
	struct
	{
		BYTE al, ah, dummy_al, dummy_ah, bl, bh, dummy_bl, dummy_bh,
			 cl, ch, dummy_cl, dummy_ch, dl, dh, dummy_dl, dummy_dh;
	} byte;
} regs;

int main(void)
{
	regs.dword.eax = 0x12345678;
	printf("0x%X\n", regs.dword.eax);

	regs.word.ax = 0x1234;
	printf("0x%X\n", regs.dword.eax);
	
	regs.byte.ah = 0x11;
	regs.byte.al = 0x22;
	printf("0x%X\n", regs.dword.eax);
	
	return 0;
}