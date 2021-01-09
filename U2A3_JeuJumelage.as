/* 
Nom fichier : 	U2A3_JeuJumelage.as
Programmeur : 	Ousmane Barry
Date :			5 décembre 2020
Description : 	Le but de cette applicarion est de crééer un 
				jeu de jumelage. Une grille de cartes sera
				affichée et l'utilisateur devra sélectionner
				deux cartes à la fois pour voir si elles sont 
				identiques. Le but du jeu est de jumeler toutes
				les cartes le plus rapidement possible.
*/

package {
	
	import flash.display.*;
	import flash.events.*;
	
	public class U2A3_JeuJumelage extends MovieClip {
		
		// Déclarer des constatntes pour régler les dimensions
		// de la planche de jeu.
		
		private static const RANGS:int = 4;
		private static const COLONNES:int = 4;
		private static const RANG_HAUTEUR:int = 85;
		private static const COLONNE_LARGEUR:int = 85;
		private static const RANG_DECALAGE:int = 60;
		private static const COLONNE_DECALAGE:int = 10;
		
		private var carteUn:Cartes;
		private var carteDeux:Cartes;
		private var cartesRestantes:int = RANGS*COLONNES;
		
		public function U2A3_JeuJumelage():void 
		{
			var totalCartes:int = RANGS*COLONNES/2;
			var paquetCartes:Array = new Array();
			
			for (var i:int=0; i <totalCartes; i++)
			{
				paquetCartes.push(i);
				paquetCartes.push(i);
			}

			
			// Créer et afficher une planche de jeu de 
			// 4 rangées par 4 colonnes.
			
			for (var c:int=0; c< COLONNES; c++)
			{
				for (var r:int=0; r< RANGS; r++)
				{
					var affichageCarte:Cartes = new Cartes();
					affichageCarte.stop();
					affichageCarte.x= c*COLONNE_LARGEUR+COLONNE_DECALAGE;
					affichageCarte.y= r*RANG_HAUTEUR+RANG_DECALAGE;
					
					var noRang = Math.floor(Math.random()*paquetCartes.length);
					affichageCarte.rectoCarte = paquetCartes[noRang];
					paquetCartes.splice(noRang, 1);
					// affichageCarte.gotoAndStop(affichageCarte.rectoCarte+2);
					
					affichageCarte.addEventListener(MouseEvent.CLICK, clicSouris);
					
					addChild(affichageCarte);
				} // Fin boucle for intérieure 
				
			} // Fin boucle for extérieure 
			
		} // Fin function U2A3_JeuJumelage
		
		public function clicSouris(event:MouseEvent)
		{
			var carteChoisie:Cartes = (event.currentTarget as Cartes);
			
			if (carteUn == null)
			{
				carteUn = carteChoisie;
				
				carteUn.gotoAndStop(carteChoisie.rectoCarte+2);
			}
			else if (carteUn == carteChoisie)
			{
				carteUn.gotoAndStop(1);
				carteUn = null;
			}
			else if (carteDeux == null)
			{
				carteDeux = carteChoisie;
				
				carteDeux.gotoAndStop(carteChoisie.rectoCarte+2);
				
				if (carteUn.rectoCarte == carteDeux.rectoCarte)
				{	
					removeChild(carteUn);
					removeChild(carteDeux);
				
					carteUn = null;
					carteDeux = null;
					
					cartesRestantes = cartesRestantes - 2;
					
					if (cartesRestantes == 0)
					{
						MovieClip(root).gotoAndStop("finPartie");
					}
				}
			}
			else 
			{
				carteUn.gotoAndStop(1);
				carteDeux.gotoAndStop(1);
				carteDeux = null;
				
				carteUn = carteChoisie;
				carteUn.gotoAndStop(carteChoisie.rectoCarte+2);
			}
		} // Fin function clicSouris
		
	} // Fin class 
	
} // Fin package