package bitrise.prostokvashino.editor.points
{
	import bitrise.prostokvashino.base.points.Map;
	import bitrise.prostokvashino.base.points.RoadBase;
	
	import flash.display.Sprite;

	public class EditorMap extends Map
	{
		
		private var _sprite:Sprite;
		
		public function getPoints(x:Number, y:Number, radius:Number, points:Vector.<EditorPoint> = null):Vector.<EditorPoint> {
			if (!points)
				points = new Vector.<EditorPoint>();
			for each(var road:EditorRoad in vector) {
				road.getPoints(x, y, radius, points);
			}
			return points;
		}
		
		override public function addRoad(road:RoadBase):RoadBase {
			if (_sprite) {
				EditorRoad(road).draw(_sprite);
			}
			return super.addRoad(road);
		}
		
		override public function addRoadAt(road:RoadBase, index:uint):RoadBase {
			if (_sprite) {
				EditorRoad(road).draw(_sprite);
			}
			return super.addRoadAt(road, index);
		}
		
		override public function removeRoad(road:RoadBase):RoadBase {
			const index:int = vector.indexOf(road);
			if (index >= 0) {
				if (_sprite) {
					EditorRoad(road).clear(_sprite);
				}
			}
			return super.removeRoad(road);
		}
		
		override public function removeRoadAt(index:uint):RoadBase {
			const road:RoadBase = vector[index];
			if (road) {
				if (_sprite) {
					EditorRoad(road).clear(_sprite);
				}
			}
			return super.removeRoadAt(index);
		}
		
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
				EditorRoad(road).draw(display);
			}
		}
		
		public function clear(display:Sprite):void {
			for each(var road:RoadBase in vector) {
				EditorRoad(road).clear(display);
			}
		}
		
	}
}