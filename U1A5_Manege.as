package {
	import flash.display.*;
	import flash.events.MouseEvent;
	
	public class U1A5_Manege extends MovieClip {
		
		public function U1A5_Manege():void 
		{
			btn.addEventListener(MouseEvent.CLICK, decision);
		}
		
		private function decision (Event:MouseEvent):void {
			
			var taHauteur:int;
			taHauteur = int(hauteur.text);
			var tesMauxDos:String;
			tesMauxDos =(mauxdos.text);
			var tonCoeur:String;
			tonCoeur =(cardiaque.text);

			if ((taHauteur < 188 && taHauteur > 122) && (tesMauxDos.toUpperCase() == "N") && (tonCoeur.toUpperCase() == "N")){
				var message_entrer:String;
				message_entrer = ("Vous pouvez prendre \nplace à bord. \nBonne randonnée!");   
				txtMessage.text=message_entrer;
				trace(txtMessage.text);
			}
			else{
				var message_sortie:String;
				message_sortie = ("Désolé! Ce n'est pas \nsécuritaire pour vous de \nprendre place à bord.");
				txtMessage.text=message_sortie;
				trace(txtMessage.text);
			}
	
		}
	}
}