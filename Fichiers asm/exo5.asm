.DATA
	chaine DW "bonjour."

.CODE 
	LEA SP,STACK 
	LD R0,%00000000  
	LEA R1,chaine ; Adresse de la chaine -> R1
	LD R2,%11110111
	LD R3,10
	LD R4,10
	OUT R0,5
boucle: CMP [R1],'.' ; Vérification de fin de chaîne
	BEQ fin
	OUT R4,1 ; Changer les coordonnées
	OUT R3,2
	OUT [R1],3 ; Envoyer le caractère courant
	OUT R2,5
	INC R1
	ADD R4,10
	JMP boucle
fin: LD R2,%11110010 ; Soulignage
	OUT R3,1
	OUT R3,2
	OUT R4,3
	OUT R3,4
	OUT R2,5
	
	HLT
.STACK 10