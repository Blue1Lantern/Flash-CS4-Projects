/*	
Nom du fichier : U1A7_Puissances.as

Programmeur : Alpha Ousmane Kegneko Barry

Date : Lundi 30 novembre 2020

Description : Ce programme calcule les puissances de 1 à 
			  un exposant donné par l'utilisateur d'une 
			  base qui sera donné par l'utilisateur
*/

package {
	// J'importe toutes les choses nécessaires
	import flash.display.*;
	import flash.events.MouseEvent;
	import flash.text.*;
	
	// Je crée la classe publique dans laquelle on va travailler
	public class U1A7_Puissances extends MovieClip {
		
		// Variale privé qui va contenir le format de mon texte 
		private var monFormatDeTexte:TextFormat= new TextFormat();
		
		/*
		Fonction qui vérifie si un évenement à été déclenché et qui restreint la 
		boite de saisie aux chiffres de 1 à 9 avec les charactères "-" et "."
		*/
		public function U1A7_Puissances() {
			btnCalcule.addEventListener(MouseEvent.CLICK, calcule);
			btnCalcule.addEventListener(MouseEvent.MOUSE_OVER, agrandit);
			btnCalcule.addEventListener(MouseEvent.MOUSE_OUT, retrecit);
			txtBase.restrict = "0-9\\.\\-";
			txtExposant.restrict = "0-9\\-";
		}
		
		// Fonction qui agrandit le bouton quand la souris passe dessus
		private function agrandit(event:MouseEvent):void {
			btnCalcule.x=581.3;
			btnCalcule.y=151.7;
			btnCalcule.width=81.3;
			btnCalcule.height=81.3;
		}
		
		// Fonction qui réinitialise le bouton à ses coordonnées initial quand la souris n'est plus dessus
		private function retrecit(event:MouseEvent):void {
			btnCalcule.x=587.5;
			btnCalcule.y=157.9;
			btnCalcule.width=68.9;
			btnCalcule.height=68.9;
		}
		
		// Fonction qui s'éxecute lorsque le bouton est cliqué et qui fera les calculs demandés
		private function calcule(event:MouseEvent):void {
			
			// Je crée les variables nécessaires
			var base:Number;
			base=Number(txtBase.text);
			var exposant:Number;
			exposant=Number(txtExposant.text);
			var nouvMessage:String;
			
			// Je fais le formatage de mon texte
			monFormatDeTexte.font="Arial";
			monFormatDeTexte.size=20;
			monFormatDeTexte.color=0x0000FF;
			
			// Code qui vide la boite à chaque iteration et qui assigne le formatage précedent à la boite de "TextArea"
			mcBoiteTexte.text="";
			mcBoiteTexte.setStyle("textFormat", monFormatDeTexte);
			
			// Message qui s'affichera si les nombres entrer par l'utilisateur ne sont pas correct
			if (isNaN(base)||isNaN(exposant)) {
				nouvMessage = ("Le(s) nombre(s) que vous venez d'entrer ne sont pas valide! Veuillez entrer le(s) nombre(s) correctement.");
				mcBoiteTexte.enabled=true;
				mcBoiteTexte.appendText(nouvMessage);
			}
			
			// Si les nombres entrer par l'utilisateur sont correct, les calculs se feront grace à ce code si dessous
			else {
				if(exposant<0){
					for (var u:Number=1; u >= exposant; u--) {
						var puissanceNegatif:Number;
						if (u==1 || u==0) {
							puissanceNegatif = Math.pow(base, Math.abs(u));
							nouvMessage = (base + " à l'exposant " + u + " = " + puissanceNegatif + "\n");
						}
						else {
							puissanceNegatif = 1/(Math.pow(base, Math.abs(u)));
							nouvMessage = (base + " à l'exposant " + u + " = " + puissanceNegatif + "\n");
						}
						mcBoiteTexte.enabled=true;
						mcBoiteTexte.appendText(nouvMessage);
					}
				}
				else {
					for (var i:Number=1; i <= exposant; i++) {
						var puissancePositif:Number;
						puissancePositif = Math.pow(base, i);
						nouvMessage = (base + " à l'exposant " + i + " = " + puissancePositif + "\n");
						mcBoiteTexte.enabled=true;
						mcBoiteTexte.appendText(nouvMessage);
					}
				
				}
			
			}
		
		}
	
	}

}