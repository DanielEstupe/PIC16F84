; Elemental_08.asm
; Por el puerto B se saca del dato del puerto A desplazando un
; bit por la derecha, por la izquierda encontrarA un "0". 

LIST P=16F84A   
INCLUDE <P16F84A.INC>  

ORG 	0   

bsf		STATUS, RP0   
clrf	TRISB			
movlw	B'11111'
movwf	TRISA
bcf		STATUS, RP0		

ciclo
	rrf		PORTA, w
	movwf 	PORTB
	goto 	ciclo
END