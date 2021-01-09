package {
	
	import flash.display.*;
	import flash.events.MouseEvent;
	
	public class tache1_unite2 extends MovieClip {
		
		public function tache1_unite2(){
			btnTest.addEventListener(MouseEvent.CLICK, montre);
		}
	
		private function montre(event:MouseEvent):void {
			var monTableau:Array = new Array();
			
			monTableau.push({nom: "Ousmane", age: 17});
			monTableau.push({nom: "Binta", age: 13});
			monTableau.push({nom: "Houlayematou", age: 9});
			monTableau.push({nom: "Aboubacar", age: 8})
			
			for (var i:int=0; i < monTableau.length; i++){
				trace("Personne #" + (i+1) + " :");
				for (var monTableauCle:String in monTableau[i]){
					trace(monTableauCle + ": " + monTableau[i][monTableauCle]);
				} 
			}
			
		}
	}
}