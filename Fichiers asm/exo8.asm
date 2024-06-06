.DATA
	hauteur DW 60
	longueur DW 200
	x DW 128
	y DW 128

.CODE 
	LEA SP,STACK
	; Effacer l'�cran
	LD R5,0
	out R5,5

	; Initialisation des param�tres
	LD R0,12
	LD R1,hauteur
	LD R2,longueur
	LD R3,x
	LD R4,y

	; Mettre les param�tres dans la pile
	PUSH R0
	PUSH R1
	PUSH R2
	PUSH R3
	PUSH R4
	CALL Dessinrectangle
	HLT
	
; Dessin du rectange
Dessinrectangle: 
	PUSH R0
	PUSH R1
	PUSH R2
	PUSH R3
	PUSH R4

	; R�cup�rer les param�tres
	LD R0,[SP+10] ; couleur
	LD R1,[SP+9] ; hauteur
	LD R2,[SP+8] ; longueur
	LD R3,[SP+7] ; x
	LD R4,[SP+6] ; y

	; Calculer les coordonnées
    LD R5, R3   ; copie de x
    LD R6, R2   ; copie de longueur
    DIVU R6, 2
    SUB R5, R6  ; x - longueur/2
	OUT R5,1

    LD R5, R4   ; copie de y
    LD R6, R1   ; copie de hauteur
    DIVU R6, 2
    SUB R5, R6  ; y - hauteur/2
	OUT R5,2

	; Envoyer les valeurs aux ports
	out R2,3
	out R1,4
	
	; Creer la commande graphique
	MULU R0,16
	ADD R0,5

	; Envoyer les infos aux ports pour affichage
	out R0,5

	; Vider la pile
	PULL R0
	PULL R1
	PULL R2
	PULL R3
	PULL R4
	ret 5

.STACK 20