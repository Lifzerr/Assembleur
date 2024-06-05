.DATA
	
.CODE 
	LEA SP,STACK 
	LD R5,0
	OUT R5,5
	LD R0,0
	LD R1,0
	LD R2,0
	LD R3,255
	LD R4,16
	
boucle: 
	PUSH R0
	PUSH R1
	PUSH R2
	PUSH R3
	PUSH R4
	call Dessinrectangle
	ADD R0,1
	ADD	R2,8
	CMP R0,16  ; Vérifier si on a fait toutes les couleurs
	BEQ fin
	JMP boucle
fin: HLT
	
Dessinrectangle: 
	PUSH R0
	PUSH R1
	PUSH R2
	PUSH R3
	PUSH R4

	; Récupérer les infos
	LD R0,[sp+10]
	LD R1,[sp+9]
	LD R2,[sp+8]
	LD R3,[sp+7]
	LD R4,[sp+6]

	; Envoyer aux ports
	OUT R1,1
	OUT R2,2
	OUT R3,3
	OUT R4,4

	; Créer la commande graphique
	MULU R0,16
	ADD R0,5

	; l'envoyer
	OUT R0,5

	; Vider la pile
	PULL R0
	PULL R1
	PULL R2
	PULL R3
	PULL R4
	ret 5
	
	

.STACK 20