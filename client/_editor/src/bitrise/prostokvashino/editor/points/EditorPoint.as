package bitrise.prostokvashino.editor.points
{
	import bitrise.prostokvashino.base.points.PointBase;
	
	public class EditorPoint extends PointBase
	{
		
		public var building:EditorBuilding;
		public var temp:Boolean;
		public var select:Boolean = false;
		public var lastLength:Number = Number.MAX_VALUE;
		
		public function EditorPoint(x:Number=0, y:Number=0)
		{
			super(x, y);
		}
		
		override public function get name():String {
			if (building)
				return building.name;
			return super.name;
		}
		
	}
}