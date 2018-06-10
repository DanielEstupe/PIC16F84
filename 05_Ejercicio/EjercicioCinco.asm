; Saltos_02.asm
; Comparar entrada de PORTA con un nUmero
; Si PORTA = nUmero -> encender todos los leds de salida
; Si PORTA != nUmero -> encender pares y apagar impares
; PORTB será la salida

LIST	P = 16F84A
INCLUDE	<P16F84A.INC>

ORG		0	

NUMERO	EQU H'20' ; H'20' es la posición en memoria que usará para almacenar datos
movlw	D'10'
movwf	NUMERO	; NUMERO ahora tiene el valor decimal 10

bsf		STATUS, RP0
clrf	TRISB
movlw	B'11111'
movwf	TRISA
bcf		STATUS, RP0

ciclo
	movf 	PORTA, w
	sublw	NUMERO
	btfsc	STATUS, Z
	goto 	todo
	goto 	pares
mostrar
	movwf	PORTB
	goto 	ciclo

todo
	movlw	B'11111111'
	goto mostrar

pares
	movlw	B'01010101'
	goto mostrar
END