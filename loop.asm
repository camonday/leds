;
; diodkiSuperCool.asm
;
; Created: 02.05.2022 12:17:11
; Author : arkad
;

start:
; Ustaw output
	SBI DDRD, 2
	SBI DDRD, 3
	SBI DDRD, 4
	SER r16

LESS:
; Funkcja zmniejsza liczbe zapalonych lampek
	cpi r16, 3
	breQ more
	lsr r16
	out PortD, r16
	rcall times
	rjmp less

MORE:
; Funkcja zwieksza liczbe zapalonych lampek
	cpi r16, 31
	breQ less
	sec
	rol r16
	out PortD, r16
	rcall times
	rjmp more
	
times:
; Obsluga czasu 
	ldi r17, 31
TIME:
	ldi r24, low(1021)     
	ldi r25, high(1021)
					     
DELAY_LOOP:            
	adiw r24, 1          
	brne DELAY_LOOP
	dec r17
	brne TIME
	ret



