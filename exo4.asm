.DATA
		chaine DW "abcdxas"
			   DW 0
		maxi DSW 1
.CODE
		; Initialisations des registres
		LEA SP,STACK
		LEA R2,chaine
		LD R1,0
		; Exécution de la boucle
boucle:	LD R0,[R2]
		CMP R0,0 ; Vérif condition de fin
		BEQ fin
		CMP R1,R0 ; Récupérer le maxi de R1 & R0
		BLT ajout
		INC R2
		JMP boucle
ajout:	LD R1,R0
		INC R2
		JMP boucle
		; fin du programme
fin: 	ST R1,maxi
		HLT



.STACK 10