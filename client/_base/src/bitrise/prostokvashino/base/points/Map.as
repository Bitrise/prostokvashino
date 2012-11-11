package bitrise.prostokvashino.base.points
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.EventDispatcher;

	public class Map extends EventDispatcher
	{
		
		public var vector:Vector.<RoadBase>;
		
		public function Map() {
			vector = new Vector.<RoadBase>();
		}
		
		public function addRoad(road:RoadBase):RoadBase {
			vector.push(road);
			if (_sprite) {
				road.draw(_sprite);
			}
			return road;
		}
		
		public function addRoadAt(road:RoadBase, index:uint):RoadBase {
			vector.splice(index, 0, road);
			if (_sprite) {
				road.draw(_sprite);
			}
			return road;
		}
		
		public function removeRoad(road:RoadBase):RoadBase {
			const index:int = vector.indexOf(road);
			if (index >= 0) {
				vector.splice(index, 1);
				if (_sprite) {
					road.clear(_sprite);
				}
			}
			return road;
		}
		
		public function removeRoadAt(index:uint):RoadBase {
			const road:RoadBase = vector[index];
			if (road) {
				vector.splice(index, 1);
				if (_sprite) {
					road.clear(_sprite);
				}
			}
			return road;
		}
		
		private var _sprite:Sprite;

		public function get sprite():Sprite {
			return _sprite;
		}

		public function set sprite(value:Sprite):void {
			if (_sprite)
				clear(_sprite);
			_sprite = value;
			if (_sprite) {
				draw(_sprite);
			}
		}
		
		public function draw(display:Sprite):void {
			clear(display);
			for each(var road:RoadBase in vector) {
				road.draw(display);
			}
		}
		
		public function clear(display:Sprite):void {
			for each(var road:RoadBase in vector) {
				road.clear(display);
			}
		}
		
	}
}