; Suma de dos números 

; El nible de los cuatros bits más significativos será el primer sumando
; y el nible de los cuatro menos significativos será el segundo sumando

LIST	P = 16F84A
INCLUDE	<P16F84A.INC>

ORG		0	

MS_POB	EQU H'20' ; MORE -> más significativo
LS_POB	EQU H'21' ; LESS -> menos significativo

bsf		STATUS, RP0
clrf	TRISA
movlw	B'11111111'
movwf	TRISB
bcf		STATUS, RP0

ciclo

	movf    PORTB,w
	andlw   H'0F'
	movwf  LS_POB
	
	movf    PORTB,w
	andlw   H'F0'
	movwf  MS_POB
	
	swapf   MS_POB,w
	addwf   LS_POB, w     ;sumas ambos nibles
	movwf  PORTA

	goto ciclo

END