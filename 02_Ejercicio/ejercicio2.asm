; Elemental_09.asm
; Por el puerto B se saca el dato del puerto A invirtiendo
; los bits pares. Los impares se dejan como en la entrada

LIST P=16F84A   
INCLUDE <P16F84A.INC>  

ORG 	0   

bsf		STATUS, RP0    
clrf	TRISB			
movlw	B'11111'
movwf	TRISA
bcf		STATUS, RP0		

ciclo
	movf	PORTA, w
	xorlw 	B'00010101'
	movwf 	PORTB
	goto 	ciclo
END