/* 
Nom fichier : 	U2A3_JeuJumelage.as
Programmeur : 	Ousmane Barry
Date :			2 janvier 2021
Description : 	À partir d'une chaine de caractères inscrite
				par l'utilisateur, le programme listera tous 
				les mots formés par les permutations des 
				lettres de la chaine.
*/

package {
	
	import flash.text.*;
	import flash.display.*;
	import flash.events.MouseEvent;
	
	public class U3A2_BrasseMot2 extends MovieClip {
		
		var format:TextFormat = new TextFormat();
		
		public function U3A2_BrasseMot2():void {
			
			btnPermute.addEventListener(MouseEvent.CLICK, permute);
			
			txtMot.restrict = "A-Z//a-z";
			txtMot.maxChars = 16;
			
			format.size=20;
			format.font="Arial";
			txtMot.setStyle("textFormat", format);
		}
		
		function permute(event:MouseEvent) {
			
			var mot:String=txtMot.text;
			
			var tableau:Array=mot.split("");
			
			var n:int=mot.length;
			
			permuteMot(tableau, 0, n-1);
		}
		
		function echange(g:String, d:String) {
			var t:String;
			t=g;
			g=d;
			d=t;
		}
		
		function permuteMot(mot:Array, gauche:int, droite:int) {
			
			var i:int;
			if(gauche==droite) {
				var affichage:String=txtAffichage.text;
				affichage.
			}
			else {
				for(i=gauche; i<=droite; i++) {
					echange(mot[gauche], mot[i]);
					permuteMot(mot, gauche+1, droite)
					echange(mot[gauche], mot[i]);
				}
			}
		}
	}
}