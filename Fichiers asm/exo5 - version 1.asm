.DATA
	chaine DW "Assembleur."

.CODE 
	LEA SP,STACK 
	LD R0,0
	LEA R1,chaine ; Adresse de la chaine -> R1
	LD R2,%11110111
	LD R3,10
	LD R4,10
	OUT R3,1
	OUT R3,2
	OUT R0,5
boucle: CMP [R1],'.' ; Vérification de fin de chaîne
	BEQ fin
	OUT [R1],3 ; Envoyer le caractère courant
	OUT R2,5
	INC R1
	ADD R4,7
	JMP boucle

	; Soulignage
fin: HLT
.STACK 10