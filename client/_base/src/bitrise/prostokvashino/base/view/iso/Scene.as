package bitrise.prostokvashino.base.view.iso
{
	import bitrise.prostokvashino.base.points.Map;
	import bitrise.prostokvashino.base.points.PointBase;
	
	import flash.display.Sprite;
	
	import mx.core.UIComponent;
	
	public class Scene extends UIComponent
	{
		public function Scene()
		{
			super();
			addChild(new EmbedScene.test);
		}
		
		private var _map:Map;
		private var _mapChangeFlag:Boolean = false;
		
		public function get map():Map {
			return _map;
		}
		
		public function set map(value:Map):void {
			_map = value;
			_mapChangeFlag = true;
			invalidateProperties();
		}

		override protected function commitProperties():void {
			super.commitProperties();
			if (_mapChangeFlag) {
				_mapChangeFlag = false;
				
			}
		}

	}
}