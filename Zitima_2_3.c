/*
 * Zitima_2_3.c
 *
 * Created: 19-May-19 19:57:32
 *  Author: Alexandros
 */ 

#include <avr/io.h>
char x;
int main(void)
{
DDRA=0xFF; // ???????????? PORTA ?? output
DDRC=0x00; // ???????????? PORTC ?? input
x = 1; // ???????????? ?????????? ??? ?????? ???????? led
PORTA = x; // ?????? ?? PORTA
while(1)
{
	if ((PINC & 0x01) == 1){ // ??????? ????????? push-button SW0
		while ((PINC & 0x01) == 1); // ??????? ?????????? push-button SW0
		if (x==128) // ??????? ???????????
		x = 1;
		else
		x = x<<1; // ???????? ????????
		}
	else if ((PINC & 0x02) == 2)	{
		while ((PINC & 0x02) == 2);
		if (x==1)
		x=128;
		else
		x =x>>1; //???????? ?????
	}
	else if ((PINC & 0x04) == 4)	{
		while ((PINC & 0x04) == 4);
		x=128;
	}
	else if ((PINC & 0x08) == 8)	{
		while ((PINC & 0x08) == 8);
		x=1;
	}
	PORTA = x; // ?????? ?? PORTA
}
return 0;
}