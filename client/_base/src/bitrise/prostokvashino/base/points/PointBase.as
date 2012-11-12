package bitrise.prostokvashino.base.points
{

	public class PointBase
	{
		
		public var x:Number;
		public var y:Number;
		public var name:String;
		
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