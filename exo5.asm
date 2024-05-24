; Programme exo 5

.DATA 
		; Initialisations des variables
		chaine DW "test."
		arret DW "."
		
.CODE 
		LEA SP,STACK
		LEA R0,chaine
		LD R1,%01110000
		LD R0, 0 ; Effacer l’écran
		OUT R0,5

boucle: CMP [R0],arret
		BEQ fin
		ADD R1,[R0]
		OUT [R0],5
		JMP boucle
fin: 	HLT
		
.STACK 4