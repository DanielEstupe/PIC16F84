; Go in and Go out
; Recibir entrada por el puerto A y mostrar la salida en el puerto B

LIST P=16F84A   ;procesador utilizado
INCLUDE <P16F84A.INC>  ;en enste fichero se definen las etiquetas del PIC

ORG 	0   ;a partir de que posicion en memoria empieza

bsf		STATUS, RP0     ;configura el puerto STATUS con RP0 a 1
clrf	TRISB			; configura todos los pines del puerto B como salida al estar en 0
movlw	B'11111111'
movwf	TRISA			; configura todos los pines del puerto A como entrada al estar todos en 1
bcf		STATUS, RP0		; regresar al banco configurando en 0

ciclo
	movf	PORTA, w	; la entrada en PORTA la pasa a w
	movwf 	PORTB		; el valor en w pasa a la salida en PORTB
	goto ciclo			; se repite el ciclo
END



