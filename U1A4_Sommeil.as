/* 	Nom du programmeur: Alpha Ousmane Barry
	Date: 20 novembre 2020
	Nom du fichier:  U1A4_Monnaie.as
	Description:  Créér un calculateur d'heure de sommeil
*/

package{
	// J'importe les choses necessaires pour mon programme
	import flash.display.*;
	import flash.text.*;
	import flash.events.MouseEvent;
	// Je cree une classe publique qui contiendra tout mon bloc de code
	public class U1A4_Sommeil extends MovieClip{
		private var monMessage:TextField=new TextField; 
		private var maMiseEnForme:TextFormat=new TextFormat;
		// Fonction qui verifie si le bouton rouge est cliquer ou pas
		public function U1A4_Sommeil():void
		{
			btn.addEventListener(MouseEvent.CLICK, calculAgeEtHeure);
		}
		// Fonction privé qui dit à l'ordinateur quoi faire lorsque le bouton est cliqué
		private function calculAgeEtHeure(event:MouseEvent):void {
			// Mise en forme de mon texte qui s'affichera apres les calculs
			maMiseEnForme.color=0x611e26
			maMiseEnForme.size=20;
			maMiseEnForme.font="Arial";
			maMiseEnForme.bold=true;
			// Mise en forme du message et l'enplacement du message
			monMessage.autoSize=TextFieldAutoSize.LEFT;
			monMessage.defaultTextFormat=maMiseEnForme;
			monMessage.border=true;
			monMessage.x=286,1;
			monMessage.y=347,3;
			// Je crée les variables nécessaires au bon fonctionnement de mon code
			var nbJourFinal:int;
			var nbHeureSommeil:int;
			
			var finAnnee:int;
			finAnnee = int(anneeAjd.text);
			var debutAnnee:int;
			debutAnnee = int(anneeNaissance.text);
			var finMois:int;
			finMois = int(moisAjd.text);
			var debutMois:int;
			debutMois = int(moisNaissance.text);
			var finJour:int;
			finJour = int(jourAjd.text);
			var debutJour:int;
			debutJour = int(jourNaissance.text);
			
			//Je fais les calculs grace aux valeurs entrere par l'utilisateur en convertissant les données en jours
			var ecart_annee:int;
			ecart_annee = (finAnnee - debutAnnee)*365;
			var ecart_mois:int;
			ecart_mois = (finMois - debutMois)*30;
			var ecart_jour:int;
			ecart_jour = finJour - debutJour;
			
			// Je stocke les écarts en jours dans une variable et le nombre d'heure de sommeil dans une autre variable
			nbJourFinal = ecart_annee + ecart_mois + ecart_jour;
			nbHeureSommeil = nbJourFinal * 8;
			
			// Je crée enfin le message qui devra s'afficher 
			var nouvMessage:String;
			nouvMessage = ("Tu es agé de " + nbJourFinal + " jours." +
						   "\nTu as dormi " + nbHeureSommeil + " heures" +
						   "\ndepuis ta naissance");
						   
			monMessage.text=nouvMessage;
			addChild(monMessage);
		}
	}
}
			
			