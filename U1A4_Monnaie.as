/* 	Nom du programmeur: Alpha Ousmane Barry
	Date: 20 novembre 2020
	Nom du fichier:  U1A4_Monnaie.as
	Description:  Écrire une brève desription du programme
*/
   
//  IMPORTANT!!! Identifie les endroits où des modifications seront 
//  apportées et explique les à l'aide de commentaires unilignes.
   
   
package {
	import flash.display.*;
	import flash.text.*;
	import flash.events.MouseEvent;

	public class U1A4_Monnaie extends MovieClip {

		private var monMessage:TextField=new TextField; 
		private var maMiseEnForme:TextFormat=new TextFormat;


		public function U1A4_Monnaie():void
		{
			
			btnSoumettre.addEventListener(MouseEvent.CLICK, calculeMonnaie);

		}
		
		private function calculeMonnaie(event:MouseEvent):void {

		
			maMiseEnForme.font="Arial";
			maMiseEnForme.size=20;
			maMiseEnForme.bold=true;
			maMiseEnForme.color=0x660000;
			monMessage.x=20;
			monMessage.y=190;

			monMessage.autoSize=TextFieldAutoSize.LEFT;
			monMessage.border=true;
			monMessage.defaultTextFormat=maMiseEnForme;

			
			var somme:Number;
			var totalCents:int;
			
			// J'ajoute la variable pour la piece de 2 dollars
			var pieces2Dollar:int=0;
			
			// J'ajoute la variable pour la piece de 1 dollars
			var pieces1Dollar:int=0;
		
			var pieces25Cents:int=0;
			var pieces10Cents:int=0;
			var pieces5Cents:int=0;
			var pieces1Cent:int=0;
			var restant:int=0;
			var nouvMessage:String;

			somme = Number(montant.text);
			totalCents = int(somme * 100);
			
			// J'ajoute le montant de piece de 2 dollar qu'il y aura pour la valeur que l'utilisateur donnera
			pieces2Dollar = totalCents / 200;
			restant = totalCents % 200;
			
			// J'ajoute le montant de piece de 1 dollar qu'il y aura pour la valeur que l'utilisateur donnera
			pieces1Dollar = restant / 100;
			restant = restant % 100;
			
			pieces25Cents = restant / 25;
			restant= restant % 25;

			pieces10Cents = restant  / 10;
			restant = restant % 10;

			pieces5Cents = restant / 5;
			restant = restant % 5;

			pieces1Cent = restant;
			
			montant.text=" ";

			// Ici j'ajoute les deux pieces que l'on vient de créér 
			nouvMessage =("Montant à transformer en monnaie: " + somme + "$" + 
						  "\n\n2 dollars: " + pieces2Dollar +
						  "\n1 dollar: " +pieces1Dollar + 
						  "\n25 cents: " + pieces25Cents + 
						  "\n10 cents: " + pieces10Cents + 
						  "\n5 cents: " + pieces5Cents + 
						  "\n1 cent: " + pieces1Cent);

			monMessage.text=nouvMessage;
			addChild(monMessage);

		}
	}
}