; Saltos_01.asm
; Si el bit 0 del PORTA = 1 se encienden todos los leds
; Si el bit 0 del PORTA = 0 solo se encienden los leds del nibble alto
; La salida será el PORTB

LIST 	P = 16F84A
INCLUDE <P16F84A.INC>

ORG		0

bsf		STATUS, RP0
clrf	TRISB
movlw	B'11111'
movwf	TRISA
bcf 	STATUS, RP0

ciclo
	movf	PORTA, w
	btfsc	STATUS, Z
	goto 	medio
	goto 	todo
mostrar
	movwf	PORTB
	goto 	ciclo

todo
	movlw	B'11111111'
	goto mostrar

medio
	movlw	B'11110000'
	goto mostrar

END
