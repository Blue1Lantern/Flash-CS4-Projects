// Nom du fichier:  U2A2_ElevesGestion.as

package {

import flash.display.*;
import flash.text.*;
import flash.events.MouseEvent;


public class U2A2_ElevesGestion extends MovieClip {
		
  // Déclarer un tableau pouvant contenir un nombre indéterminé d'éléments.
  var eleve:Array = new Array();
  // Déclarer une variable pour contenir la liste des noms à afficher.
  var liste:String;
 
  public function U2A2_ElevesGestion() {
	
	// Ajouter un détecteur d'événement pour réagir à un clic sur btnListe.
	btnListe.addEventListener(MouseEvent.CLICK, lister);

	// Ajouter un détecteur d'événement pour réagir à un clic sur btnTri.
	btnTri.addEventListener(MouseEvent.CLICK, trier);

	// Ajouter un détecteur d'événement pour réagir à un clic sur btnAjout.
	btnAjout.addEventListener(MouseEvent.CLICK, ajouter);

	// Ajouter un détecteur d'événement pour réagir à un clic sur btnSupression.
	btnSuppression.addEventListener(MouseEvent.CLICK, supprimer);

	include "U2A2_ElevesListe.as"
  } // Fin fonction


  // Fonction pour réagir à un clic sur bouton btnListe.
  function lister(event:MouseEvent):void {
	
	liste="";

	for (var i=0; i<eleve.length; i++)
	{
 		liste = liste + ("Élève [" + i + "] : " + eleve[i] + "\n");
	}
	
	affichage.text = liste;
	 
  } // Fin lister
	

  // Fonction pour réagir à un clic sur bouton btnTri.
  function trier(event:MouseEvent):void {
	
	// Trier les éléments du tableau par ordre alphabétique.
	eleve.sort();	
	
  } // Fin trier


  // Fonction pour réagir à un clic sur bouton btnAjout.
  function ajouter(event:MouseEvent):void {
		
	// Ajouter un nouvel élève au tableau.
	eleve.push(saisieNomEleve.text);	
	
  } // Fin ajouter


  // Fonction pour réagir à un clic sur bouton btnSuppression.
  function supprimer(event:MouseEvent):void {
	
	var indiceEleve:int;
	
	indiceEleve =(eleve.indexOf(saisieNomEleve.text)); 
	
	// La méthode indexOf renvoie the l'indice d'un élément ou -1 si non trouvé.
	
	if (indiceEleve != -1)
	{
		for (var i=indiceEleve; i <eleve.length; i++)
		{
			eleve[i] = eleve[i+1];
		}
		eleve.pop();
	}
					
  } // Fin supprimer
	
} // Fin classe

}  // Fin paquetage