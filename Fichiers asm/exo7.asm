.DATA
	x DSW 1
	y DSW 2
.CODE
	LEA SP,STACK
	LD R5,0 ; Effacer écran
	OUT R5,5
clique: IN R0,0 ; Détection clique 
	CMP R0,%11000111
	BEQ aClique
	JMP clique
aClique: 
	IN R1,6 ; Stockage coord clique
	IN R2,7
	ST R1,x 
	ST R2,y
	CALL grandCarre
boucle: IN R0,0 ; Début boucle
	; Vérifier si A est préssé
	CMP R0,%11000101 
	BEQ A

	; Vérifier si A est relaché
	CMP R0,%10000101 
	BEQ AA

	; Vérifier si B est pressée
	CMP R0,%11000110 
	BEQ B
	JMP boucle
A:	CALL petitCarre
	JMP boucle
AA: CALL grandCarre
	JMP boucle
B:	HLT

; Procédure petit carré
petitCarre: LD R5,0 
	OUT R5,5
	; Récupérer les coord. dans les registres pour les envoyer aux ports
	LD R1,x 
	LD R2,y
	SUB R1,25 ; Soustraire 1/2 côté
	SUB R2,25
	LD R3,50 ; taille d'un côté du carre
	LD R5,%11110011 ; Commade graphique de tracé
	OUT R1,1 
	OUT R2,2 
	OUT R3,3
	OUT R3,4
	OUT R5,5
	RET
grandCarre: LD R5,0 ; Procédure grand carré
	OUT R5,5 
	; Récupérer les coord. dans les registres pour les envoyer aux ports
	LD R1,x
	LD R2,y
	SUB R1,50 ; Soustraire 1/2 côté
	SUB R2,50
	LD R3,100 ; taille d'un côté du carre
	LD R5,%11110011 ; Commade graphique de tracé
	OUT R1,1
	OUT R2,2
	OUT R3,3
	OUT R3,4
	OUT R5,5
	RET
.STACK 20
