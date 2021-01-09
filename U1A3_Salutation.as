package	{
	import flash.display.*;
	import flash.text.*;
	public class U1A3_Salutation extends MovieClip {
		
		public function U1A3_Salutation() {
			var monMessage:TextField=new TextField();
			var maMiseEnForme:TextFormat=new TextFormat;
			
			maMiseEnForme.font="Arial";
			maMiseEnForme.size=30;
			maMiseEnForme.bold=true;
			maMiseEnForme.color=0xFF00FF;
			monMessage.x=100;
			monMessage.y= 50;
			monMessage.border=true;
			monMessage.autoSize=TextFieldAutoSize.LEFT;
			monMessage.defaultTextFormat=maMiseEnForme;
			
			monMessage.text="Salut!\n Je m'appelle Guido!";
			addChild(monMessage);
		}
	}
}