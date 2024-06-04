.DATA
	hauteur DW 16
	longueur DW 256
	x DW 0
	y DW 0
	coul DW 0

.CODE 
	LEA SP,STACK
	; Effacer l'�cran
	LD R5,0
	out R5,5

	; Initialisation des param�tres
	LD R0,coul
	LD R1,hauteur
	LD R2,longueur
	LD R3,x
	LD R4,y

	; V�rification de terminaison
draw: CMP R0,16
	BGEU end

	; Passage des param�tres
	PUSH R0
	PUSH R1
	PUSH R2
	PUSH R3
	PUSH R4

	; Dessin + maj couleur & y
	CALL Dessinrectangle
	INC R0
	ADD R4,16

end: HLT

	; Dessin du rectange
Dessinrectangle: 
	; R�cup�rer les param�tres
	PULL R4
	PULL R3
	PULL R2
	PULL R1
	PULL R0

	; Cr�er la commande graphique
	MULU R0,16
	ADD R0,5

	; Envoyer les infos aux ports pour affichage
	out R1,1
	out R2,2
	out R3,3
	out R4,4
	out R0,5
	ret 


.STACK