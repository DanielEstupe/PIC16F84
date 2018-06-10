; Elemental_03.asm
; Por el Puerto B se obtiene el dato introducido por el puerto A.
; Pero los bits pares de la salida se fijan siempre a "1".
; El orden de los bits será "b7 b6 b5 b4 b3 b2 b1 b0", siendo los
; pares el b6, b4, b2 y b0.

LIST 	P = 16F84A
INCLUDE <P16F84A.INC>

ORG		0

bsf		STATUS, RP0    
clrf	TRISB			
movlw	B'11111'
movwf	TRISA
bcf		STATUS, RP0		

ciclo
	movf	PORTA, w
	iorlw 	B'00010101'
	movwf 	PORTB
	goto 	ciclo

END