.DATA
	hauteur DW 200
	longueur DW 60
	x DW 20
	y DW 25

.CODE 
	LEA SP,STACK
	; Effacer l'écran
	LD R5,0
	out R5,5

	; Initialisation des paramètres
	LD R0,12
	LD R1,hauteur
	LD R2,longueur
	LD R3,x
	LD R4,y

	; Mettre les paramètres dans la pile
	PUSH R0
	PUSH R1
	PUSH R2
	PUSH R3
	PUSH R4
	CALL Dessinrectangle
	
; Dessin du rectange
Dessinrectangle: 
	; Récupérer les paramètres
	PULL R4
	PULL R3
	PULL R2
	PULL R1
	PULL R0

	; Créer la commande graphique
	MULU R0,16
	ADD R0,3

	; Envoyer les infos aux ports pour affichage
	out R1,1
	out R2,2
	out R3,3
	out R4,4
	out R0,5
	ret 

.STACK 20