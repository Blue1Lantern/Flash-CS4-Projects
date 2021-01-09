package 
{	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	public class U1A3_BonhommeFilDeFer extends MovieClip 
	{	
		private var _valXDep:Number;
		private var _valYDep:Number;
		public function U1A3_BonhommeFilDeFer()
		{
			_valXDep = this.scaleX;
			_valYDep = this.scaleY;
			this.addEventListener(MouseEvent.ROLL_OVER, grossit);
			this.addEvenTListener(MouseEvent.ROLL_OUT, rapetisse);
		}
		private function grossit(event:MouseEvent):void 
		{
			this.scaleX *= 1.5;
			this.scaleY *= 1.5; 
		}
		private function rapetisse(event:MouseEvent):void 
		{
			this.scaleX = _valXDep; 
			this.scaleY = _valYDep; 
		}
	}
}