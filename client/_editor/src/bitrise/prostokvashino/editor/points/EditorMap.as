package bitrise.prostokvashino.editor.points
{
	import bitrise.core.format.json.JSON;
	import bitrise.prostokvashino.base.points.Building;
	import bitrise.prostokvashino.base.points.Map;
	import bitrise.prostokvashino.base.points.PointBase;
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
		
		override public function removeRoad(road:RoadBase):RoadBase {
			const index:int = vector.indexOf(road);
			if (index >= 0) {
				if (_sprite) {
					EditorRoad(road).clear(_sprite);
				}
			}
			return super.removeRoad(road);
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
		
		private var mem:Object;
		
		override public function deserialize(json:String):void {
			free();
			mem = new Object();
			const object:Object = JSON.decode(json);
			for each(var building:Object in object.buildings) {
				const b:EditorBuilding = createBuilding(building) as EditorBuilding;
				addBuilding(b);
			}
			for each(var road:Object in object.roads) {
				const r:EditorRoad = createRoad(road) as EditorRoad;
				for each(var point:Object in road.points) {
					const p:EditorPoint = createPoint(point) as EditorPoint;
					r.addPoint(p);
				}
				addRoad(r);
			}
			mem = null;
		}
		
		override protected function createBuilding(building:Object):Building {
			const b:EditorBuilding = new EditorBuilding(building.source);
			b.name = building.name;
			mem[b.name] = b;
			b.x = building.x;
			b.y = building.y;
			b.apply();
			return b;
		}
		
		override protected function createRoad(road:Object):RoadBase {
			const r:EditorRoad = new EditorRoad();
			return r;
		}
		
		override protected function createPoint(point:Object):PointBase {
			const p:EditorPoint = new EditorPoint();
			p.name = point.name;
			const b:EditorBuilding = mem[p.name];
			if (b) {
				p.building = b;
				b.point = p;
			}
			p.x = point.x;
			p.y = point.y;
			return p;
		}
		
	}
}