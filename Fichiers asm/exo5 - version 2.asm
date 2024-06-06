.DATA
	chaine DW "Assembleur Super."

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
fin: LD R2,%11110010 

	; Coordonnées pt départ
	OUT R3,1
	LD R5,R3
	ADD R5,5
	OUT R5,2

	; Coordonnées y
	OUT R4,3
	OUT R5,4

	OUT R2,5
	HLT
.STACK 10