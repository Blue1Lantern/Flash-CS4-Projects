/* 
Nom fichier : 	U2A3_JeuJumelage.as
Programmeur : 	Ousmane Barry
Date :			2 janvier 2021
Description : 	Le but de cette applicarion est de créer un
				programme qui peut afficher le nom d'un livre 
				grace à son numéro de référence
*/

// Création du paquetage qui contiendra tout notre code
package {
	
	// Importation des fonctions nécessaires au bon fonctionnement du programme
	import flash.text.*;
	import flash.display.*;
	import flash.events.MouseEvent;
	
	// Création d'une classe publique 
	public class U3A3_Livres extends MovieClip  {
		
		// Tableau contenant numéros de références et nom des livres
		var livre:Array = new Array();
		
		// Variable TextFormat qui contiendra le formatage de notre texte
		var format:TextFormat = new TextFormat();
		
		// Variable qui contiendra l'indice du milieu de la liste du tableau
		var milieu:int;
		
		// Fonction publique qui contient les restrictions, écouteur d'événement, formatage et l'inclusion d'un fichier externe
		public function U3A3_Livres():void {
			
			// Écouteur d'événement pour le bouton
			btnTrouve.addEventListener(MouseEvent.CLICK, trouve);
			
			// Restriction dans la zone d'entrée de texte par l'utilisateur
			txtRef.restrict = "0-9";
			txtRef.maxChars = 2;
			
			// Formatage de l'affichage du message
			format.size=20;
			format.font="Arial";
			txtLivre.setStyle("textFormat", format);
			
			// Inclusion du fichier externe contenant le numéro de référence et le nom du livre
			include "U3A3_FichierDeLivres.as";
			
		} // Fin fonction U3A3_Livres()
		
		// Fonction qui recherche parmi le tableau le numéro de référence donnée par l'utilisateur
		public function rechercheLivre(liste:Array, gauche:int, droite:int, recherche:int):Boolean {
			
			// Création boucle while qui tournera tant que gauche est plus petit ou égale à droite
			while (gauche <= droite) {
				
				// Attribution d'une valeur a la variable milieu
				milieu = (gauche + droite)/2;
				var valeur = liste[milieu][0];
				
				// Si la valeur du milieu est plus petit que la valeur entrée alors la valeur de gauche devient la valeur du milieu + 1
				if (valeur < recherche) {
					gauche = milieu + 1;
				}
				// Si la valeur du milieu est plus grande que la valeur entrée alors la valeur de droite devient la valeur du milieu - 1
				else if (valeur > recherche) {
					droite = milieu - 1;
				}
				// Si la valeur du milieu est égale à la valeur entrée alors true est retournée à la fonction
				else {
					return true;
				} // Fin déclaration if
				
			} // Fin boucle while
			
			// Si la valeur du milieu n'est pas trouvée alors false est retournée à la fonction
			return false;
			
		} // Fin fonction rechercheLivre()
		
		// Fonction qui se met en marche lorsque le bouton est cliqué par l'utilisateur
		function trouve(event:MouseEvent) {
			
			// Attribution de la valeur entrée par l'utilisateur à une variable
			var numeroRef:int = int(txtRef.text);
			
			// Si la boite de saisie est vide, alors le message d'erreur suivant est affiché
			if (txtRef.text=="") {
				format.color=0xFF0000;
				txtLivre.text="Veuillez entrer un nombre/chiffre avant d'effectuer une recherche!";
			}
			// Si la boite de saisie est remplie, alors le code ci dessous se met en marche
			else {
				// La fonction qui recherche le numéro de référence est appellée
				rechercheLivre(livre, 0, livre.length - 1, numeroRef);
				
				// La valeur Boolean que retourne la fonction est stockée dans une variable Boolean
				var resultat:Boolean = rechercheLivre(livre, 0, livre.length - 1, numeroRef);
			
				// Si la fonction retourne true, on affiche le nom du livre lié à ce numéro de référence
				if (resultat == true) {
					format.color=0x000000;
					txtLivre.text="Le nom du livre ayant le numéro de référence " + String(numeroRef) + " est : " + livre[milieu][1] + ".";
				} // Fin déclaration if
				
				// Si le fonction retourne false, on affiche un message d'erreur
				if (resultat == false) {
					format.color=0xFF0000;
					txtLivre.text="Un livre possèdant le numéro de référence " + String(numeroRef) + " n'existe pas!";
				} // Fin déclaration if
				
			} // Fin déclaration if
			
		} // Fin fonction trouve()
		
	} // Fin classe U3A3_Livres()
	
} // Fin paquetage