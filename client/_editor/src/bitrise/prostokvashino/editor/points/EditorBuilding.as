package bitrise.prostokvashino.editor.points
{
	import bitrise.prostokvashino.base.points.Building;
	
	public class EditorBuilding extends Building
	{
		
		private static var count:uint = 0;
		
		public var point:EditorPoint;
		
		public function EditorBuilding(source:Object)
		{
			super(source);
			name = new Date().time + "_" + ++count;
		}
	}
}