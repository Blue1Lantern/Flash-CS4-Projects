package	{
	import flash.display.*;
	import flash.text.*;
	public class U1A3_Bonjour extends MovieClip {
		
		public function U1A3_Bonjour() {
			var monMessage:TextField=new TextField();
			var maMiseEnForme:TextFormat=new TextFormat;
			
			maMiseEnForme.font="Arial";
			maMiseEnForme.size=30;
			maMiseEnForme.bold=true;
			maMiseEnForme.color=0xFF0000;
			monMessage.x=100;
			monMessage.y= 50;
			monMessage.border=true;
			monMessage.autoSize=TextFieldAutoSize.LEFT;
			monMessage.defaultTextFormat=maMiseEnForme;
			
			monMessage.text="Bien le bonjour!\n J'adore programmer";
			addChild(monMessage);
		}
	}
}