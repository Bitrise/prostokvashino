package bitrise.prostokvashino.base.points
{
	import flash.display.Sprite;

	public class BuildingSprite extends Sprite
	{
		
		private var _source:Object;
		private var _building:Building;
		
		public function BuildingSprite(building:Building) {
			mouseChildren = false;
			_building = building;
		}
		
		public function get building():Building {
			return _building;
		}
		
		public function get source():Object {
			return _source;
		}
		
		public function set source(value:Object):void{
			_source = value;
			if (_source is Class) {
				addChild(new _source);
			} else if (_source is String) {
				const index:int = _source.toString().indexOf("EmbedBuilding_");
				if (index != -1) {
					source = EmbedBuilding[_source.toString().substring(index + "EmbedBuilding_".length)]
				}
			}
		}
	}
}