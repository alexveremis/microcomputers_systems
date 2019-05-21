.include "m16def.inc"
reset: ldi r24 , low(RAMEND) ; initialize stack pointer
out SPL , r24
ldi r24 , high(RAMEND)
out SPH , r24
ser r24 ; initialize PORTA for output
out DDRB , r24
clr r26 ; clear time counter
clr r16
inc r26
main: out PORTB , r26
kathisterisi:
in r16,PINA
andi r16,0x01
cpi r16,0
brne kathisterisi
ldi r24 , low(500) ; load r25:r24 with 500
ldi r25 , high(500) ; delay 0.5 second
rcall wait_msec
lsl r26 ; shift left time counter, half a second passed
cpi r26 , 128 ; compare time counter with 129 >128
brlo main ; if lower goto main, else main2
main2: out PORTB , r26
kathisterisi2:
in r16,PINA
andi r16,0x01
cpi r16,0
brne kathisterisi2
ldi r24 , low(500) ; load r25:r24 with 500
ldi r25 , high(500) ; delay half second
rcall wait_msec 
lsr r26
cpi r26 , 1
brsh main2
clr r26 ; 8eloyme na valoume to 1 ston r26
inc r26
rjmp main

wait_msec:
push r24 ; 2 ?????? (0.250 ?sec)
push r25 ; 2 ??????
ldi r24 , low(998) ; ??????? ??? ?????. r25:r24 ?? 998 (1 ?????? - 0.125 ?sec)
ldi r25 , high(998) ; 1 ?????? (0.125 ?sec)
rcall wait_usec ; 3 ?????? (0.375 ?sec), ???????? ???????? ??????????? 998.375 ?sec
pop r25 ; 2 ?????? (0.250 ?sec)
pop r24 ; 2 ??????
sbiw r24 , 1 ; 2 ??????
brne wait_msec ; 1 ? 2 ?????? (0.125 ? 0.250 ?sec)
ret ; 4 ?????? (0.500 ?sec)

wait_usec:
sbiw r24 ,1 ; 2 ?????? (0.250 ?sec)
nop ; 1 ?????? (0.125 ?sec)
nop ; 1 ?????? (0.125 ?sec)
nop ; 1 ?????? (0.125 ?sec)
nop ; 1 ?????? (0.125 ?sec)
brne wait_usec ; 1 ? 2 ?????? (0.125 ? 0.250 ?sec)
ret ; 4 ?????? (0.500 ?sec)
;KATHISTERISI 0.5 SEC --->OK
;OSO TO PA0 PATIMENO NA STAMATAEI I KINISI---> ok