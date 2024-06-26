.DATA
    premier_clic dw 0 
    x DSW 1;
    y DSW 1;
    cx DSW 1
    cy DSW 1
    couleur DW 15
.CODE 
	LEA SP,STACK 
	; Effacer l'écran
	LD R5,0
	OUT R5,5

	; Initialiser pour le dessin de la 'mire'
	LD R0,0
	LD R1,0
	LD R2,0
	LD R3,20
	LD R4,16
	
dessinlignemire: 
    PUSH R0
	PUSH R1
	PUSH R2
	PUSH R3
	PUSH R4
	call Dessinrectangle
	add R0,1    ; Maj couleur
	add	R2,8  
	CMP R0,16   ; Vérif barre terminée
	BEQ boucleClics   
	JMP dessinlignemire


boucleClics:
	in R0,0
	; Attente de A
	CMP R0,%11000101
	BEQ effacer

	; Attente de b
	CMP R0, %11000110
	BEQ fin

	; Attente de clic
	cmp r0,%11000111
	BNE boucleClics

	IN R3,6
	IN R4,7
	ST R3,x
	ST R4,y

	; Vérifier dans quelle zone on a cliqué
	CMP R3,20
	BLEU changercouleur
	JMP CLZoneD


changercouleur: 
	; Récupérer R4 pour trouver la couleur
    DIVU R4,16
	ST R4,couleur
	JMP boucleClics

CLZoneD: 
    LD R0,premier_clic
	CMP R0,0
	BEQ premierclic
	JMP tracer

premierclic: 
    INC R0
	ST r0,premier_clic 
	JMP misjpos

tracer: 
    LD R0,couleur
	LD R1,cx
	LD R2,cy
	PUSH R0 ; couleur
	PUSH R1 ; cx
	PUSH R2; cy
	PUSH R3 ;x
	PUSH R4 ;y
	call Dessinligne


misjpos: 
	; Envoyer les x,y précédents dans cx & cy
    ST R3,cx
	ST R4,cy
	jmp boucleClics	
	HLT

effacer: ; tracer un rectangle noir
	PUSH R0
	PUSH R1
	PUSH R2
	PUSH R3
	PUSH R4
	LD R0,20
	LD R1,0
	LD R2,235
	LD R3,255
	LD R4, %00000101
	OUT R0,1
	OUT R1,2
	OUT R2,3
	OUT R3,4
	OUT R4,5
	PULL R4
	PULL R3
	PULL R2
	PULL R1
	PULL R0
	JMP boucleClics


fin: HLT



Dessinrectangle: PUSH R0
	PUSH R1
	PUSH R2
	PUSH R3
	PUSH R4
	LD R0,[sp+10]
	LD R1,[sp+9]
	LD R2,[sp+8]
	LD R3,[sp+7]
	LD R4,[sp+6]
	OUT R1,1
	OUT R2,2
	OUT R3,3
	OUT R4,4
	MULU R0,16
	add R0,5
	OUT R0,5
	PULL R0
	PULL R1
	PULL R2
	PULL R3
	PULL R4
	ret 5


Dessinligne:  PUSH R0
	PUSH R1
	PUSH R2
	PUSH R3
	PUSH R4
	LD R0,[sp+10]
	LD R1,[sp+9]
	LD R2,[sp+8]
	LD R3,[sp+7]
	LD R4,[sp+6]
	OUT R1,1
	OUT R2,2
	OUT R3,3
	OUT R4,4
	MULU R0,16
	add R0,2
	OUT R0,5
	PULL R4
	PULL R3
	PULL R2
	PULL R1
	PULL R0
	ret 5
	



.STACK 20