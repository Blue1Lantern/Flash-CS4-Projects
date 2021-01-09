// Nom du fichier:  U2A2_SommeElements.as

package {

import flash.display.*;
import flash.text.*;
import flash.events.MouseEvent;


public class U2A2_SommeElements extends MovieClip {
	var affichage:String="";  	// variable pour stocker une liste de tous les éléments du tableau.
	var sommeMessage:String=""; 	// variable pour stocker le message indicant si la somme est pour 
  								//     tous les entiers, les pairs ou les impairs.
	var somme:int;					// variable pour stocker la somme calculée.
	
	// Déclarer un tableau servant à stocker un nombre inconnu d'éléments.
	var mesEntiers:Array = new Array();
	
  
  
	
  	// ****************************************************************
  	// Fonction constructeur de la classe.
  	public function U2A2_SommeElements() 
  	{
	
    	// Ajouter écouteur d'événement pour réagir à clic sur btnAjouter.
    	btnAjouter.addEventListener(MouseEvent.CLICK, ajouter);


    	// Ajouter écouteur d'événement pour réagir à clic sur btnSupprimer.
		btnSupprimer.addEventListener(MouseEvent.CLICK, supprimer);
	
    	// Ajouter écouteur d'événement pour réagir à clic sur btnSommeTotale.
    	btnSommeTotale.addEventListener(MouseEvent.CLICK, sommeTotale);

    	// Ajouter écouteur d'événement pour réagir à clic sur btnSommePairs.
		btnSommePairs.addEventListener(MouseEvent.CLICK, sommePairs);

    	// Ajouter écouteur d'événement pour réagir à clic sur btnSommeImpairs.
		btnSommeImpairs.addEventListener(MouseEvent.CLICK, sommeImpairs);
	
		// Ajouter écouteur d'événement pour réagir à clic sur btnAfficher.
		btnAfficher.addEventListener(MouseEvent.CLICK, afficher);
    	// Taper l'instruction include.
    	include "U2A2_Elements.as"
		

  	} // Fin fonction constructeur



	// ****************************************************************  
  	// Fonction quit peut etre appeller à la fin des autres fonctions pour afficher le changement directement
  	function afficherResultat() 
  	{
		affichage="";
	  	for (var i=0; i<mesEntiers.length; i++)
	  	{
	  		affichage = affichage + ("Element #" + i + " = " + mesEntiers[i] + "\n");
	  	}
	  	mcMessageTexte.text = affichage;
  	}
	
	
	
  
  	// ****************************************************************  
  	// Fonction pour réagir à un clic sur btnAfficher.
  	function afficher(event:MouseEvent):void 
  	{
		// Compose cette fonction visant à afficher tous les éléments du tableau.
		afficherResultat();
	 
  	} //Fin fonction afficher.
  
  
  
  
  	// ****************************************************************
  	// Fonction pour réagir à un clic sur btnAjouter.
  	function ajouter(event:MouseEvent):void 
  	{
    	// Declare variables to hold the input (integer) value
		var entierSaisiAjt:String;
		var entierAjt:int;
	
		// Lire le texte du champ de saisie et le stocker dans une variable String.
		entierSaisiAjt=(IntegersIn_txt.text);
	
		// Convertir la chaîne de caractères saisie (String) en un entier (int).
		entierAjt=int(entierSaisiAjt);
	
		// Ajouter le nouvel entier à la fin du tableau.
		mesEntiers.push(entierAjt);
	
		// AFfiche le changement directement
		afficherResultat();
		
  	} // Fin fonction ajouter.




  	// ****************************************************************
  	// Fonction pour réagir à un clic sur btnSupprimer.
  	function supprimer(event:MouseEvent):void 
  	{
		var entierSup:int;
		entierSup=int(IntegersIn_txt.text);
		
		for (var i=0; i<mesEntiers.length; i++) 
		{
			if (mesEntiers[i] == entierSup) {
				mesEntiers.splice(i,1);

			}
			else {
				// Ne fait rien
			}
		}
		afficherResultat();
	
  	} // Fin fonction supprimer.




  	// ****************************************************************
 	// Fonction pour réagir à un clic sur btnSommeTotale.
  	function sommeTotale(event:MouseEvent):void 
  	{
		var sommeTotale:int;
		affichage="";
	
		for (var i=0; i<mesEntiers.length; i++)
		{
 	  		sommeTotale = sommeTotale + mesEntiers[i];
	  		affichage = affichage + ("Element #" + i + " = " + mesEntiers[i] + "\n");
		}
	
		somme=sommeTotale;
		sommeMessage="La somme de TOUS les entiers est: ";
		mcMessageTexte.text = sommeMessage + somme;
	
  	} // Fin fonction sommeTotale.




  	// ****************************************************************
  	// Fonction pour réagir à un clic sur btnSommeImpairs.
  	function sommeImpairs(event:MouseEvent):void 
  	{
		var sommeImpairs:int;
		
		for (var i=0; i<mesEntiers.length; i++)
		{
			if ((mesEntiers[i] % 2) != 0) {
				sommeImpairs = sommeImpairs+ mesEntiers[i];
			}
			else {
				// Ne fait rien et continue la boucle for
			}
		}
	
		somme=sommeImpairs;
		sommeMessage="La somme des entiers IMPAIRS est: ";
		mcMessageTexte.text = sommeMessage + somme;
		
		
  	} // Fin fonction sommeImpairs.




  	// ****************************************************************
  	// Fonction pour réagir à un clic sur btnSommePairs.
  	function sommePairs(event:MouseEvent):void
  	{
		var sommePairs:int;
		
		for (var i=0; i<mesEntiers.length; i++)
		{
			if ((mesEntiers[i] % 2) == 0) {
				sommePairs = sommePairs+ mesEntiers[i];
			}
			else {
				// Ne fait rien et continue la boucle for
			}
		}
	
		somme=sommePairs;
		sommeMessage="La somme des entiers PAIRS est: ";
		mcMessageTexte.text = sommeMessage + somme;
	
  	} // Fin fonction sommePairs.

} // Fin classe.

}  // Fin paquetage.