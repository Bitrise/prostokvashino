package bitrise.prostokvashino.base.points
{
	import flash.events.EventDispatcher;

	public class PointBase extends EventDispatcher
	{
		
		public var x:Number;
		public var y:Number;
		
		public function PointBase(x:Number = 0, y:Number = 0) {
			this.x = x;
			this.y = y;
		}
		
		public function move(x:Number, y:Number):void {
			this.x = x;
			this.y = y;
		}
	}
}