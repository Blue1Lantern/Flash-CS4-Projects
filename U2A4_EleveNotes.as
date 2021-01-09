// Nom fichier:  U2A4_EleveNotes_Cadre.as

package {

  import flash.display.*;
  import flash.text.*;
  import flash.events.MouseEvent;


  public class U2A4_EleveNotes extends MovieClip {
		
    var affichage:String="";

    var rang1:Array=[];
    var eleveInfo:Array = [rang1];
 
    public function U2A4_EleveNotes() {
	
      // Ajouter écouteur d'événement pour réagir à clic sur btnAfficher.
      btnAfficher.addEventListener(MouseEvent.CLICK, afficher);

      // Ajouter écouteur d'événement pour réagir à clic sur btnAjouter.
      btnAjouter.addEventListener(MouseEvent.CLICK, ajouter);

      // Ajouter écouteur d'événement pour réagir à clic sur btnSupprimer.
      btnSupprimer.addEventListener(MouseEvent.CLICK, supprimer);

      // Ajouter écouteur d'événement pour réagir à clic sur btnCalculerMoyenne.
	  btnCalculerMoyenne.addEventListener(MouseEvent.CLICK, calculerMoyenne);
	  
	  // Restrictions pour l'input de l'utilisateur
	  saisiePrenom.restrict = "A-Z a-z";
	  saisieNom.restrict = "A-Z a-z";
	  saisieNote1.restrict = "0-9";
	  saisieNote2.restrict = "0-9";
	  saisieNote3.restrict = "0-9";
	  saisieNote4.restrict = "0-9";

      include "U2A4_EleveInfo.as"

    } // Fin constructeur.



    // Fonction qui me permettra d'afficher la liste automatiquement sans réécrire le bloc de code
	
	function affichageAutomatique() {
		
		affichage="";

      	for (var rang:int = 0; rang < eleveInfo.length; rang++) 
      	{
        	for( var col:int=0; col < eleveInfo[0].length; col++)
        	{
          		affichage = affichage + " " + eleveInfo[rang][col];
        	}
        	affichage = affichage + "\n"; 
      	}
      	message_texte.text = affichage;
	} // Fin fonction affichageAutomatique()
	
	
	// Fonction qui efface les boites de saise 
	
	function nettoyageSaisieTexte() {
      saisiePrenom.text = "";
      saisieNom.text ="";
      saisieNote1.text ="";
      saisieNote2.text ="";
	  saisieNote3.text="";
	  saisieNote4.text="";
	} // Fin fonction nettoyageSaisieTexte()
	
	
    //Fonction qui montre la liste après que le bouton afficher soit cliquer

    function afficher(event:MouseEvent):void {

      affichage="";

      affichageAutomatique();
	  
      message_texte.text = affichage;

      nettoyageSaisieTexte()

    } // Fin fonction afficher.
	
    
	// Fonction qui ajoute une nouvelle rangée au tableau bidimensionnel grace aux données saisie par l'utilisateur
	
    function ajouter(event:MouseEvent):void {
	
      var prenom:String;
      var nom:String;
      var note1:int;
      var note2:int;
	  var note3:int;
	  var note4:int;
	  
      
      prenom = saisiePrenom.text;
	  nom = saisieNom.text;
      note1 = int(saisieNote1.text);
      note2 = int(saisieNote2.text);
	  note3 = int(saisieNote3.text);
	  note4 = int(saisieNote4.text);

      eleveInfo.push([prenom, nom, note1, note2, note3, note4]);
	  
	  nettoyageSaisieTexte()
	  affichageAutomatique();
	
    } // Fin fonction ajouter.

    
	// Fonction qui cherche le nom saisie, si le nom existe il supprime ses données 
	
	
    function supprimer(event:MouseEvent):void {
	
      var eleveIndiceP:int=-1;
      var eleveIndiceN:int=-1;

      for (var rang:int = 0; rang < eleveInfo.length; rang++) {
		  eleveIndiceP =(eleveInfo[rang][0].indexOf(saisiePrenom.text));
		  eleveIndiceN =(eleveInfo[rang][1].indexOf(saisieNom.text));
		  
		  if ((eleveIndiceP != -1) && (eleveIndiceN != -1)) 
		  {
			  eleveInfo.splice(rang,1);  
		  }
	  }
	  nettoyageSaisieTexte()
	  affichageAutomatique();
	  
    } // Fin fonction supprimer.

    
	/* 
	Fonction qui cherche les notes du nom saisie et calcule la moyenne, si le nom existe il les calcule 
	dans le cas contraire il met un message d'erreur demandant à l'utilisateur de réesayer
	*/

    function calculerMoyenne(event:MouseEvent):void 
    {
	  affichage="";
	  
      var eleveIndiceP:int=-1;
      var eleveIndiceN:int=-1;
	  
	  var noteEleve1:int=0;
	  var noteEleve2:int=0;
	  var noteEleve3:int=0;
	  var noteEleve4:int=0;
	  
	  var moyenneTotal:int;
	
	
	  
      for (var rang:int = 0; rang < eleveInfo.length; rang++) {
		  eleveIndiceP =(eleveInfo[rang][0].indexOf(saisiePrenom.text));
		  eleveIndiceN =(eleveInfo[rang][1].indexOf(saisieNom.text));
		  
		  noteEleve1=eleveInfo[rang][2];
		  noteEleve2=eleveInfo[rang][3];
		  noteEleve3=eleveInfo[rang][4];
		  noteEleve4=eleveInfo[rang][5];
		  
		  moyenneTotal=(noteEleve1 + noteEleve2 + noteEleve3 + noteEleve4) / 4;
		  
		  if ((eleveIndiceP != -1) && (eleveIndiceN != -1))
		  {
			  message_texte.text= "La moyenne de " + String(saisiePrenom.text) + " est : " + moyenneTotal; 
		  							
		  }
		  else 
		  {
			  message_texte.text="Ce nom n'existe pas, veuillez l'ajouter avant de pouvoir l'utiliser";
		  }
		  nettoyageSaisieTexte();
	  }

    } // Fin fonction calculerMoyenne().

  } // Fin classe.

}  // Fin paquetage.