.include "m16def.inc"
reset: ldi r24 , low(RAMEND) ; initialize stack pointer
out SPL , r24
ldi r24 , high(RAMEND)
out SPH , r24
ser r24 ; initialize PORTA for output
out DDRB , r24
clr r16
clr r17
clr r18
clr r19
clr r20
clr r21
clr r26 ; clear teliko register me apotelesma
main: out PORTB , r26
clr r26
clr r20
clr r21
in r16,PINA
in r17,PINA
in r18,PINA
in r19,PINA
andi r16,01 ;a
andi r17,0x02 ;b
lsr r17
andi r18,0x04 ;c
lsr r18
lsr r18
andi r19,0x08 ;d
lsr r19
lsr r19
lsr r19
or r20,r16 ;sozoyme a,c
or r21,r18
or r18,r19 ;c=c or d
or r16,r17 ; a=a or b
and r16,r18 ; a= (a or b) and (c or d), o r1 exei tin F1.
lsl r16 ;r1=r1 *2
or r26,r16 ; ston r26 mpainei sti sosti 8esi to F1. MEXRI EDW SWSTO
ori r16,0x01
ori r18,0x01
and r16,r20
and r18,r21
and r16,r17; a=a&b
and r16,r18; a=a&b&c
com r18; !c
andi r18,0x01
and r19,r18; d=!c&d
or r16,r19; r1= oli i parastasi i esoteriki
com r16; r1= sosto twra
andi r16,0x01
add r26,r16 ;pleon r26 exei to swsto
rjmp main

