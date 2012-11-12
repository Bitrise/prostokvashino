package bitrise.prostokvashino.base.points
{

	public class PointBase
	{
		
		public var x:Number;
		public var y:Number;
		private var _name:String;
		
		public function PointBase(x:Number = 0, y:Number = 0) {
			this.x = x;
			this.y = y;
		}
		
		public function get name():String {
			return _name;
		}

		public function set name(value:String):void {
			_name = value;
		}

		public function move(x:Number, y:Number):void {
			this.x = x;
			this.y = y;
		}
		
		
	}
}