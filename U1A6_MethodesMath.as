package {
	import flash.display.*;
	
	public class U1A6_MethodesMath extends MovieClip {
		
		public function U1A6_MethodesMath() {
			methode1();
			methode2();
		}
		
		private function methode1():void {
			var monNombre:Number=-121;
			var maValeurAbsolue:Number;
			
			maValeurAbsolue = Math.abs(monNombre);
			trace("La valeur absolue de " + monNombre + " est : " + maValeurAbsolue + "\n");
		}
		
		private function methode2():void {
			trace("Maitenant à ton tour de une autre méthode de la classe math.");
		} 
	}
}
			
		