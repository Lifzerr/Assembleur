; Programme exo 2

.DATA
	; VARIABLES REQUISES
    valinit DW 13
    Fact DSW 1
.CODE 
    LEA SP,STACK
	; Création des variables des registres
    LD R0,1
    LD R1,2
	; Boucle de calcul
boucle: CMP R1,valinit
    BGT fin ; On vérifie si c'est terminé
    MUL R0,R1
    INC R1
    JMP boucle
	; Retour
fin: ST R0,Fact
    HLT
    .STACK 5 