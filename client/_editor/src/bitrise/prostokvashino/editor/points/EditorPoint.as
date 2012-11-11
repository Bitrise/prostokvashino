package bitrise.prostokvashino.editor.points
{
	import bitrise.prostokvashino.base.points.PointBase;
	
	public class EditorPoint extends PointBase
	{
		
		public var temp:Boolean;
		public var select:Boolean = false;
		
		public function EditorPoint(x:Number=0, y:Number=0)
		{
			super(x, y);
		}
	}
}