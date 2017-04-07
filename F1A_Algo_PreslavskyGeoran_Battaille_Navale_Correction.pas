program Battle_naval_correction;

uses crt;

//README
{
	le programme marche , mais il y a quelques problèmes ue je n'arrive pas a corriger ou a expliquer.
	voici les problèmes :
	- le système de  vérification de l'emplacement ne fonctionne pas
	- si on touche un bateau en 5 et qu il a les cases 1/2/3/4/5 , il va toucher toutes les case derrière lui
	  ce qui va faire ue le joueur va gagner pas des qui aura touché toutes les case ,
	   mais qu il va gagner quand le compteur sera supérieur au nombre de case.
Remarque:
	il y a un debug system , qui se trouve juste au début de la boucle repeat pour faire les tours
}
{Bataille navale

INSTRUCTIONS

Pas utiliser de tableau à 2 dimensions pour représenter la grille du jeu.
Utiliser un enregistrement cell pour décrire les cellules occupées par des bateaux.
De même, un bateau sera décrit par un ensemble de cellules.
La flotte de bateaux à couler sera représentée par un ensemble de bateaux

travail à faire : 
1. Ecrire la structure cell composée de 2 champs ligne et colonne de type entier
2. Ecrire la structure bateau composée de n cell
3. Ecrire le type enregistrement flotte composée d'un ensemble de bateau
4. Ecrire une fonction de création d'une cell, elle prend en paramètre la ligne et la colonne associées à la cellule
5. Ecrire une fonction de comparaison de 2 cell, cette fonction renverra vrai ou faux
6. Ecrire une fonction de création de bateau, elle renverra un type enregistrement bateau correctement rempli
7. Ecrire une fonction qui vérifie qu'une cell appartient  à un bateau, cette fonction renverra vrai ou faux selon le cas /!\ Cette fonction devra utiliser la fonction de comparaison de cell
8. Ecrire une fonction qui vérifie une cell apparatient à une flotte de bateau /!\ Cette fonction devra utiliser votre fonction de vérification de bateau
9. Ecrire la bataille navale complète

//ALGO bataile navalle
//BUT voir au dessus
//ENTREE euh
//SORTIE euh 

	//constantes
	CONST
		NbBateau <- 2 : entier
		MaxCase <- 5 : entier
		MinL <- 1 : entier
		MaxL <- 50 : entier
		Minc <- 1 : entier
		MaxC <- 50 : entier

	//Types
	type Case = enregistrement 
		ligne:entier
		colonne:entier
	FinEnregistrement

	type Bateau = enregistrement
		nCase : tableau [1..maxCase] de Case
	finEnregistrement

	type flotte = enregistrement
		nbateau: tableau [1..NbBateau] de Bateau
	FinEnregistrement

	Type PositionBateau = (enLigne,enColonne,enDiag)

	type EtatBateau = (toucher,couler)

	Type Etatflotte = (aflot,asombrer)

	Type etatJoueur = (perd,Gagne)

	//Procedure & fonctions

	procedure createCase (l,c: entier ; VAR nCase : case)
		DEBut
			nCase . ligne <- l 
			nCase . col <- c
		Fin

(
	Fonction createCase (l,c:entier): case
			VAR
				nCase:Case
			DEBUT
				nCase.ligne<-l
				nCase.col<-c
				createCase<-nCase
			Fin
					)

	Fonction CmpCase(nCase , Tcase:Case):bool
		DEBUt
			Si (nCase.col = Tcase.col)ET (nCase.ligne = tCase.ligne) Alors
				cmpCase <- vrai 
			SINon
				cmpCase <- faux
			Finsi
		Fin

	Fonction createBateau (ncase:case; taille:entier):bateau
		VAr
			res:bateau
			i,pos:entier
			posBateau:positionBateau
		Debut
			pos <- Aleatoire [1..3]
			posBateau <- positionBateau(pos)

			Pour i De 1 a MaxCase pas 1 faire
				Si (i>=taille)alors
					debut
						res.ncase[i].ligne<-ncase.ligne
						res.ncase[i].col<-ncase.col
					fin
				sinon
					debut
						res.ncase[i].ligne<-0
						res.ncase[i].col<-0
					fin
				finsi
				Si positionBateau = enligne alors
					ncase.col<-ncase.col+1
				SINON Si positionBateau = encolonne alors
					ncase.ligne <- ncase.ligne+1
				SINOn
					debut
						ncase.ligne<-ncase.ligne+1
						ncase.col<-ncase.col+1
					fin
				finSI
			finpour
		createBateau <- res
		FIN

		Fonction ctrlcase (nBat:Bateau;ncase:case) : bool
			Var
				valTest:booleen
				i:entier
			Debut
				valTest<- faux
			Pour i de 1 a maxCase pas 1 faire
				debut
					si(CmpCase(nBat.nCase[i],ncase))Alors
						valTest <- vrai
					finsi
			FinPour	
			ctrlCase <- ValTest
			Fin

		Fonction ctrlFlotte (nflotte:flotte;ncase:case):booleen
			VAR
				i:entier
				valTest:Booleen
			Debut
				valTest<- faux
				Pour de i a NbBateau pas de 1 faire
					si (ctrlCase(nflotte.nbateau[i],ncase)) ALORS
						valTest<- vrai
					Finsi
				FinPour
				ctrlFlotte< - valTest
			FIn
//Variables
Var
	lig,col:entier
	nCase:Cases
	nBateau1,nBateau2:Bateau
	nflotte1,nflotte2:flotte
	i,cpt1,cpt2:entier
//programme principal
		DEBUT
		cpt1 <- 0
		cpt2 <- 0
// entrée de la case de départ par la J1
		
			ECRIRE "programme bataille navale"
					ECRIRE "Joueur 1"
					ECRIRE "entrez la ligne de votre bateau"
					LIRE(lig)
					ECRIRE "entrez la colonne de votre bateau"
					LIRE(col)
				createCase(lig,col,nCase)
				nBateau1 <- createBateau(nCase,MaxCase)
// entrée de la case de départ par la J2 ( plus une vérification de l'emplacement )
		REPEAT
					ECRIRE "Joueur 2"
					ECRIRE "entrez la ligne de votre bateau"
					LIRE(lig)
					ECRIRE "entrez la colonne de votre bateau"
					LIRE(col)
				createCase(lig,col,nCase)		
		until CmpCase(nCase,nBateau1.nCase[1]) = faux 
				nBateau2 <- createBateau(nCase,MaxCase)
			REPEAT
//Tour J1
						ECRIRE "Joueur 1"
						ECRIRE "entrez la ligne de mire"
						LIRE(lig)
						ECRIRE "entrez la colonne de mire"
						LIRE(col)
						createCase(lig,col,nCase)
						POUR i DE 1 A  MaxCase FAIRE // verif des cases
							debut
								SI ctrlCase(nBateau2,nCase) = vrai ALORS // si une case correspond au coord de tir
										ECRIRE "Touché" // les coord de tir deviennent nulles
										nBateau2.nCase[i].colonne <- 0
										nBateau2.nCase[i].ligne <- 0
										cpt1 <- cpt1 + 1
									SINOn
										ECRIRE "Manqué"
									finsi
								Finsi
							FinPour
					nflotte1.nbateau[2] <- nBateau2 
					Si ctrlFlotte(nflotte1,Ncase) = faux ALORS
//Tour J2
						ECRIRE "Joueur 2"
						ECRIRE "entrez la ligne de mire"
						LIRE(lig)
						ECRIRE "entrez la colonne de mire"
						LIRE(col)
						createCase(lig,col,nCase)
						POUR i DE 1 A  MaxCase FAIRE // verif des cases
							debut
								SI ctrlCase(nBateau1,nCase) = vrai ALORS // si une case correspond au coord de tir
										ECRIRE "Touché" // les coord de tir deviennent nulles
										nBateau2.nCase[i].colonne <- 0
										nBateau2.nCase[i].ligne <- 0
										cpt1 <- cpt1 + 1
									SINOn
										ECRIRE "Manqué"
									finsi
								Finsi
							FinPour
					nflotte1.nbateau[1] <- nBateau1

//verifie si on continue ou si un joueur a perdu
			JUSQUA (cpt1 >= maxCase) OU (cpt2 >= maxCase) // permet de sortir de la boucle

			SI (cpt2 >= maxCase) ALORS // permet de savoir qui a gagné
					ECRIRE "Joueur 2 a gagné , joueur 1 a perdu"

				SINon SI (cpt1 >= maxCase) ALORS
						ECRIRE "Joueur 1 a gagné , joueur 2 a perdu"
				FINSI
			FINSI
		FIN
}
//constantes
	CONST
		NbBateau = 2 ;
		MaxCase = 5 ;
		MinL = 1 ;
		MaxL = 50 ;
		Minc = 1 ;
		MaxC = 50 ;

//Types
	type Cases = record 
		ligne:INTEGER;
		colonne:INTEGER;
	end;

	type Bateau = record
		nCase : array [1..maxCase] of Cases
	end;

	type flotte = record
		nbateau: array [1..NbBateau] of Bateau
	end;

	Type PositionBateau = (enLigne,enColonne,enDiag);

	type EtatBateau = (toucher,couler);

	Type Etatflotte = (aFlot,aSombrer);

	Type etatJoueur = (perd,Gagne);

//Procedure & fonctions

	procedure createCase (l,c: INTEGER ; VAR nCase : Cases);
		begin
			nCase.ligne := l ;
			nCase.colonne := c ;
		end;

	Function CmpCase(nCase, Tcase:Cases):boolean;
		begin
			if (nCase.colonne = Tcase.colonne) AND (nCase.ligne = tCase.ligne) then
				cmpCase := true 
			else
				cmpCase := false;
		end;

	function CreateBateau(nCases:Cases;Taille:integer):Bateau;
VAR
    res:Bateau;
    i,pos:integer;
    posBateau:PositionBateau;
BEGIN
    randomize;
    pos:=random(3)+1;
    posBateau:=PositionBateau(pos);
    FOR i:=1 TO MaxCase DO
        begin
            IF i<=Taille THEN
                begin
                    res.nCase[i].Ligne:=nCases.Ligne;
                    res.nCase[i].colonne:=nCases.colonne;
                end
            ELSE
                begin
                    res.nCase[i].Ligne:=0;
                    res.nCase[i].colonne:=0;
                end;
            IF (posBateau=EnLigne) THEN
                begin
                    nCases.colonne:=nCases.colonne+1;
                end
            ELSE
                begin
                    IF (posBateau=EnColonne) THEN
                        begin
                            nCases.Ligne:=nCases.Ligne+1;
                        end
                    ELSE
                        begin
                            nCases.colonne:=nCases.colonne+1;
                            nCases.Ligne:=nCases.Ligne+1;
                        end;
                end;
        end;
    CreateBateau:=res;
END;

	Function ctrlcase (nBat:Bateau;ncase:Cases) : boolean;
			Var
				valTest:boolean;
				i:INTEGER;
			begin
				valTest := false;
			For i := 1 to maxCase do
				begin
					if (CmpCase(nBat.nCase[i],ncase)) then
						valTest := true;
				end;	
			ctrlCase := ValTest;
			end;

		Function ctrlFlotte (nflotte:flotte;ncase:Cases):boolean;
			VAR
				i:INTEGER;
				valTest:Boolean;
			begin
				valTest := false;
				For i:=1 to NbBateau do
				begin
					if (ctrlCase(nflotte.nbateau[i],ncase))then
						valTest := true;
				end;
				ctrlFlotte := valTest;
			end;
	//Variables
Var
	lig,col:INTEGER;
	nCase:Cases;
	nBateau1,nBateau2:Bateau;
	nflotte1,nflotte2:flotte;
	i,cpt1,cpt2:INTEGER;
//programme principal
		BEGIN
		clrscr;
		cpt1 := 0;
		cpt2 := 0;
// entrée de la case de départ par la J1
		
			writeln ('programme bataille navale');
					writeln ('Joueur 1');
					writeln ('entrez la ligne de votre bateau');
					readln(lig);
					writeln ('entrez la colonne de votre bateau');
					readln(col);
				createCase(lig,col,nCase);
				nBateau1:= createBateau(nCase,MaxCase);
// entrée de la case de départ par la J2 ( plus une vérification de l'emplacement )
		REPEAT
					writeln ('Joueur 2');
					writeln ('entrez la ligne de votre bateau');
					readln(lig);
					writeln ('entrez la colonne de votre bateau');
					readln(col);
				createCase(lig,col,nCase);		
		until CmpCase(nCase,nBateau1.nCase[1]) = false ;
				nBateau2:= createBateau(nCase,MaxCase);
			REPEAT
			clrscr;
//Debug System 
// enlevez juste les accolades pour l'afficher dans le test 
{
			writeln('debug system');
			writeln('bateau 1');
			writeln(nBateau1.nCase[1].ligne);
			writeln(nBateau1.nCase[1].colonne);
			writeln(nBateau1.nCase[2].ligne);
			writeln(nBateau1.nCase[2].colonne);
			writeln(nBateau1.nCase[3].ligne);
			writeln(nBateau1.nCase[3].colonne);
			writeln(nBateau1.nCase[4].ligne);
			writeln(nBateau1.nCase[4].colonne);
			writeln(nBateau1.nCase[5].ligne);
			writeln(nBateau1.nCase[5].colonne);
			writeln('bateau 2');
			writeln(nBateau2.nCase[1].ligne);
			writeln(nBateau2.nCase[1].colonne);
			writeln(nBateau2.nCase[2].ligne);
			writeln(nBateau2.nCase[2].colonne);
			writeln(nBateau2.nCase[3].ligne);
			writeln(nBateau2.nCase[3].colonne);
			writeln(nBateau2.nCase[4].ligne);
			writeln(nBateau2.nCase[4].colonne);
			writeln(nBateau2.nCase[5].ligne);
			writeln(nBateau2.nCase[5].colonne);
			writeln('compteur1 ',cpt1);
			writeln('compteur2 ',cpt2);
			readln;
}
//--------------------------------------------------\\
//Tour J1
						writeln ('Joueur 1');
						writeln ('entrez la ligne de mire');
						readln(lig);
						writeln ('entrez la colonne de mire');
						readln(col);
						createCase(lig,col,nCase);
						For i:=1 to  MaxCase do// verif des cases
							begin
								if ctrlCase(nBateau2,nCase) = true then // si une case correspond au coord de tir
									begin
										writeln ('Touché'); // les coord de tir deviennent nulles
										nBateau2.nCase[i].colonne := 0;
										nBateau2.nCase[i].ligne := 0;
										cpt1 := cpt1 + 1;
									end
								else // sinon
									writeln ('Manqué');
							end;
						readln;
					nflotte1.nbateau[2] := nBateau2 ;
					if ctrlFlotte(nflotte1,Ncase) = false then
						begin
//Tour J2
							writeln ('Joueur 2');
							writeln ('entrez la ligne de mire');
							readln(lig);
							writeln ('entrez la colonne de mire');
							readln(col);
							createCase(lig,col,nCase);
							For i:=1 to  MaxCase do// verif des cases
								begin
									if ctrlCase(nBateau1,nCase) = true then // si une case correspond au coord de tir
										begin
											writeln ('Touché'); // les coord de tir deviennent nulles
											nBateau1.nCase[i].colonne := 0;
											nBateau1.nCase[i].ligne := 0;
											cpt2 := cpt2 + 1;
										end
									else // sinon
										writeln ('Manqué');
								end;
							readln;
						end;
			nflotte2.nbateau[1] := nBateau1 ;
			//verifie si on continue ou si un joueur a perdu
			until (cpt1 >= maxCase) OR (cpt2 >= maxCase) ; // permet de sortir de la boucle

			if (cpt2 >= maxCase) then // permet de savoir qui a gagné
				begin
					writeln ('Joueur 2 a gagné , joueur 1 a perdu');
					readln;
				end
			else if (cpt1 >= maxCase) then
				begin
					writeln ('Joueur 1 a gagné , joueur 2 a perdu');
					readln;
				end;
		END.