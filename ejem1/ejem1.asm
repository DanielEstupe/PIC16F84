; Hola Mundo PIC16F84A
; Encender un led, en la posición RB0 del PIC 16F84

LIST P=16F84A   ;procesador utilizado
INCLUDE <P16F84A.INC>  ;en enste fichero se definen las etiquetas del PIC

ORG 	0   ;a partir de que posicion en memoria empieza

bsf		STATUS, RP0    ;configura el puerto STATUS con RP0 a 1
clrf	TRISB			; configura el puerto B como salida al estar en 0
bcf		STATUS, RP0		; regresar al banco configurando en 0

movlw 	B'00000001'
movwf 	PORTB

END



