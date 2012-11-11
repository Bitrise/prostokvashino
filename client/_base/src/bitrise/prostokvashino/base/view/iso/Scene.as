package bitrise.prostokvashino.base.view.iso
{
	import bitrise.prostokvashino.base.points.Map;
	import bitrise.prostokvashino.base.points.PointBase;
	
	import flash.display.Sprite;
	
	import mx.core.UIComponent;
	
	public class Scene extends UIComponent
	{
		
		private var _highlightSprite:Sprite;
		
		public function Scene()
		{
			super();
			addChild(new EmbedScene.test);
			
			_highlightSprite = new Sprite();
			addChild(_highlightSprite);
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
		
		private var _highlight:Boolean;
		private var _highlightChangeFlag:Boolean = false;
		
		public function get highlight():Boolean {
			return _highlight;
		}

		public function set highlight(value:Boolean):void {
			_highlight = value;
			if (_map) {
				_highlightChangeFlag = true;
				invalidateProperties();
			}
		}

		override protected function commitProperties():void {
			super.commitProperties();
			if (_mapChangeFlag) {
				_mapChangeFlag = false;
				_highlightChangeFlag = true;
			}
			if (_highlightChangeFlag && _map) {
				_highlightChangeFlag = false;
				if (_highlight) {
					_map.sprite = _highlightSprite;
				} else {
					_map.sprite = null;
				}
			}
		}

	}
}