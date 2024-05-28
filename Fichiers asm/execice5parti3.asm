.DATA
	chaine DW "bonjour."

.CODE 
	LEA SP,STACK 
	LD R0,%00000000 ; initialisation des registre 
	LEA R1,chaine
	LD R2,%11110111
	LD R3,10
	LD R4,10
	OUT R0,5
boucle: CMP [R1],'.' ; verificaton si on n'est paas à la fin de la chaine
	BEQ fin
	OUT R4,1 ; permet d'écrie caractère par caractère
	OUT R3,2
	OUT [R1],3
	OUT R2,5
	INC R1
	ADD R4,10
	JMP boucle
fin: LD R2,%11110010 ; pour souligner
	OUT R3,1
	OUT R3,2
	OUT R4,3
	OUT R3,4
	OUT R2,5
	
	hLT
.STACK 10