package {
	import flash.display.*;
	import flash.text.*;
	import flash.events.MouseEvent;
	
	public class U1A4_DivEtMod extends MovieClip {
		private var monMessage:TextField=new TextField;
		private var maMiseEnForme:TextFormat=new TextFormat;
		
		public function U1A4_DivEtMod() {
			mcButton.addEventListener(MouseEvent.CLICK, divise);
			}
		
		private function divise(event:MouseEvent):void {
			maMiseEnForme.font="Arial";
			maMiseEnForme.size=20;
			maMiseEnForme.bold=true;
			maMiseEnForme.color=0xFFFFFF;
			monMessage.x=30;
			monMessage.y=200;
			
			monMessage.autoSize=TextFieldAutoSize.LEFT;
			monMessage.border=true;
			monMessage.defaultTextFormat=maMiseEnForme;
			
			var operande1:int;
			var operande2:int;
			var repDiv1:int;
			var repModulo1:int;
			var repDiv2:int;
			var repModulo2:int;
			var nouvMessage:String;
									
			operande1=int(numberOne.text);
			operande2=int(numberTwo.text);
			
			repDiv1: operande1 / operande2;
			repModulo1: operande1 % operande2;
			repDiv2: operande2 / operande1;
			repModulo2: operande2 % operande1;
			
			nouvMessage=(
				operande1 + " / " + operande2 + " = " + repDiv1 
				+ "\n\n" + 
				operande1 + " % " + operande2 + " = " + repModulo1 
				+ "\n\n" + 
				operande2 + " / " + operande1 + " = " + repDiv2 
				+ "\n\n" + 
				operande2 + " % " + operande1 + " = " + repModulo2);
			
			monMessage.text=nouvMessage;
			addChild(monMessage);
			}
		}
}