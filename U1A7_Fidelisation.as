/* 
Nom fichier : 	U2A3_JeuJumelage.as
Programmeur : 	Ousmane Barry
Date        :	4 décembre 2020
Description : 	Le but de cette applicarion est de crééer un 
				jeu de jumelage. Une grille de cartes sera
				affichée et l'utilisateur devra sélectionner
				deux cartes à la fois pour voir si elles sont 
				identiques. Le but du jeu est de jumeler toutes
				les cartes le plus rapidement possible.
*/

package {
	
	// Importation des choses importantes au bon fonctionnement du programme
	import flash.text.*;
	import flash.display.*;
	import flash.events.MouseEvent;
	
	// Classe publique qui contient bloque de code
	public class U1A7_Fidelisation extends MovieClip {
		
		// Déclaration variable qui contiendra le formatage de la la boite de texte
		var format:TextFormat = new TextFormat();
		
		// Variable qui contiendra le texte qui s'affichera
		var liste:String = new String();
		
		// Insertion varibale qui stockera toutes les données
		var donnee:Array= new Array();
		
		
		// Déclaration de fonction qui contriendra les event listener avec les restrictions et formatage
		public function U1A7_Fidelisation():void {
			
			// Déclare les écouteurs pour les trois boutons
			btnAjouter.addEventListener(MouseEvent.CLICK, ajoute);
			btnAfficher.addEventListener(MouseEvent.CLICK, afficher);
			btnTotal.addEventListener(MouseEvent.CLICK, total);
			btnSupprimer.addEventListener(MouseEvent.CLICK, supprimer);
			
			// Restriction pour les boites de texte
			txtPrenom.restrict="A-Z//a-z";
			txtPrenom.maxChars=16;
			txtNom.restrict="A-Z//a-z";
			txtNom.maxChars=16;
			txtSemaineUne.restrict="0-9";
			txtSemaineUne.maxChars=4;
			txtSemaineDeux.restrict="0-9";
			txtSemaineDeux.maxChars=4;
			txtSemaineTrois.restrict="0-9";
			txtSemaineTrois.maxChars=4;
			txtSemaineQuatre.restrict="0-9";
			txtSemaineQuatre.maxChars=4;
			
			// Formatage de la boite d'affichage des résultats
			format.size=17;
			format.font="Arial";
			txtAffichage.setStyle("textFormat", format);
			
			// Inclusion du fichier contenant les données au programme
			include "U1A7_Milles.as";
			
			// Affiche la liste directement lors de l'exécution du programme
			affichageAutomatique();
		} // Fin fonction U1A7_Fidelisation()
		
		
		// Fonction qui sert à vider les boites de saisie 
		function nettoyageAutomatique() {
			txtPrenom.text="";
			txtNom.text="";
			txtSemaineUne.text="";
			txtSemaineDeux.text="";
			txtSemaineTrois.text="";
			txtSemaineQuatre.text="";
		} // Fin fonction nettoyageAutomatique()
		
		
		// Fonction qui peut appeler pour afficher les données automatiquement
		function affichageAutomatique() {
			
			// Je vide la liste 
			liste="";
			
			// Boucle qui va aller chercher toutes les données présentes dans la tableau associatif 
			for (var i:int=0; i < donnee.length; i++) {
				liste = liste + donnee[i].prenom + " " + donnee[i].nom + " : " + String(donnee[i].semaineUne) + " " + String(donnee[i].semaineDeux) + " " + String(donnee[i].semaineTrois) + " " + String(donnee[i].semaineQuatre) + "\n";
			} // Fin boucle for
			
			// Verifie si la liste est vide ou pas, et affiche un message conséquemment
			if (liste=="") {
				format.color=0xFF0000;
				txtAffichage.text="La liste est présentement vide. Veuillez y ajouter des personnes!"
			}
			else {
				// Affiche le texte de la liste en noir
				format.color=0x000000;
				txtAffichage.text=liste;
			} // Fin déclaration if
			
		} // Fin fonction affichageAutomatique
		
		
		// Fonction qui permet d'ajouter des nouvelles personnes au tableau uen fois le bouton ajouter cliquer
		function ajoute(event:MouseEvent):void {
			
			// Je place mes boites de saisie dans de nouvelles variables plus facile à utiliser
			var prenomAjoute:String=txtPrenom.text;
			var nomAjoute:String=txtNom.text;
			var semaineAjoute1:int=int(txtSemaineUne.text);
			var semaineAjoute2:int=int(txtSemaineDeux.text);
			var semaineAjoute3:int=int(txtSemaineTrois.text);
			var semaineAjoute4:int=int(txtSemaineQuatre.text);
			
			// Regarde si les boites ne sont pas remplies et affiche un message d'erreur 
			if (prenomAjoute=="" || nomAjoute=="" || semaineAjoute1==0 || semaineAjoute2==0 || semaineAjoute3==0 || semaineAjoute4==0) {
				format.color=0xFF0000;
				txtAffichage.text="Toutes les cases ne sont pas complètes!";
			}
			
			// Quand toutes les boites sont remplies, les données sont ajoutés dans la liste
			else {
				donnee.push({prenom: prenomAjoute, nom: nomAjoute, semaineUne: semaineAjoute1, semaineDeux: semaineAjoute2, semaineTrois: semaineAjoute3, semaineQuatre: semaineAjoute4})
				nettoyageAutomatique();
				affichageAutomatique();
			} // Fin déclaration if
		} // Fin fonction ajoute()
		
		
		// Fonction qui affiche toutes les données dans le textArea une fois le bouton afficher appuyer
		function afficher(event:MouseEvent):void {
			affichageAutomatique();
		} // Fin fonction affichageAutomatique()
		
		
		// Fonction qui montre la somme total des milles d'une personne spécifique dans la liste
		function total(event:MouseEvent):void {
			
			// Je place mes boites de saisie dans de nouvelles variables plus facile à utiliser
			var prenomTotal:String=txtPrenom.text;
			var nomTotal:String=txtNom.text;
			var sommeTotal:int;
			var trouveTotal:Boolean=false;
			
			// Boucle for qui passera dans chaque indice de la liste
			for (var i:int=0; i < donnee.length; i++) {
				
				// Vérifie si le nom et prénom entrer existe dans la liste
				if (prenomTotal==donnee[i].prenom && nomTotal==donnee[i].nom) {
					
					// Variable boolean pour verifier si le nom a été trouvé ou pas
					trouveTotal=true;
					
					// Met les milles de la personne concernée dans des variables
					var semaineTotal1:int=int(donnee[i].semaineUne);
					var semaineTotal2:int=int(donnee[i].semaineDeux);
					var semaineTotal3:int=int(donnee[i].semaineTrois);
					var semaineTotal4:int=int(donnee[i].semaineQuatre);
					
					// Calcule la somme total et la met dans une variable
					sommeTotal = semaineTotal1 + semaineTotal2 + semaineTotal3 + semaineTotal4;
					
					// Affiche le total de la personne avec 1000 milles en prime si il accumule plus de 5000 points dans le mois
					if (sommeTotal > 5000) {
						format.color=0x000000;
						txtAffichage.text= prenomTotal+ " " +nomTotal+ " à accumulé " +sommeTotal+ " milles. Il a obtenu 1000 milles en prime";
					}
					
					//Affiche le total de la personne avec 0 milles en prime si il accumule plus de 5000 points dans le mois
					else {
						format.color=0x000000;
						txtAffichage.text= prenomTotal+ " " +nomTotal+ " à accumulé " +sommeTotal+ " milles. Il a obtenu 0 mille en prime";
					} // Fin déclaration if
				} // Fin déclaration if 
			} // Fin boucle for
			
			// Si le nom n'est pas trouver, le message d'erreur suivant s'affiche
			if (trouveTotal==false) {
					format.color=0xFF0000;
					txtAffichage.text="Le nom que vous venez d'entrer n'existe pas. Veuillez l'ajouter avant de pouvoir l'utiliser!";
			} // Fin déclaration if 
			
			// Nettoie les boites de texte après l'affichage
			nettoyageAutomatique();
		} // Fin fonction total()
		
		
		// Fonction qui surpprimera un nom dans la liste 
		function supprimer(event:MouseEvent):void {
			
			// Je place mes boites de saisie dans de nouvelles variables plus facile à utiliser
			var prenomSupprimer:String=txtPrenom.text;
			var nomSupprimer:String=txtNom.text;
			var trouveSupprimer:Boolean=false;
			
			// Boucle if qui passera dans toute la liste à la recherche du nom demandé
			for (var i:int=0; i < donnee.length; i++) {
				
				// Vérifie si le nom et prénom entrer existe dans la liste
				if (prenomSupprimer==donnee[i].prenom && nomSupprimer==donnee[i].nom) {
					
					// Variable boolean pour verifier si le nom a été trouvé ou pas
					trouveSupprimer=true;
					
					// Supprime la liste de la personne demander par l'utilisateur
					donnee.splice(i,1)
					
					// Affiche la nouvelle liste et vide les boites de texte
					nettoyageAutomatique();
					affichageAutomatique();
				} // Fin déclaration if
			} // Fin boucle for 
			
			// Si le nom n'est pas trouver, le message d'erreur suivant s'affiche
			if (trouveSupprimer==false) {
					format.color=0xFF0000;
					txtAffichage.text="Le nom que vous essayer de supprimer n'existe pas!";
			} // Fin déclaration if 
		} // Fin fonction supprimer()
	} // Fin classe publique
} // FIn paquetage