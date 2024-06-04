.DATA

.CODE 
		LEA SP,STACK 
		LD R1,0
		OUT R1,5
débutboucle: 
		IN R1,0
		; Vérifier si la touche b est appuyée
		CMP R1,%11000110 
		BEQ fin

		; Vérifier si la touche A est appuyée 
		CMP R1,%11000101 
		BEQ exedessincarre50
		JMP comparaisonrelacher

exedessincarre50: 
		CALL carre50

		; Vérifier si la touche A est relachée
comparaisonrelacher: 
		CMP R1,%10000101 
		BEQ exedessincarre100
		JMP findelaboucle
exedessincarre100: 
		CALL carre100

findelaboucle: 
		JMP débutboucle
		fin: HLT
	
		; Petit carré
carre50: 
	PUSH R0 
	PUSH R2
	PUSH R3
	PUSH R4
	LD R0,0
	LD R2,102
	LD R3,50
	LD R4,%11110011
	OUT R0,5
	OUT R2,1
	OUT R2,2
	OUT R3,3
	OUT R3,4
	OUT R4,5
	PULL R4
	PULL R3
	PULL R2
	PULL R0
	ret 

	; Grand carré
carre100: 
	PUSH R0 
	PUSH R2
	PUSH R3
	PUSH R4
	LD R0,0
	LD R2,77
	LD R3,100
	LD R4,%11110011
	OUT R0,5
	OUT R2,1
	OUT R2,2
	OUT R3,3
	OUT R3,4
	OUT R4,5
	PULL R4
	PULL R3
	PULL R2
	PULL R0
	ret 
	
.STACK 10