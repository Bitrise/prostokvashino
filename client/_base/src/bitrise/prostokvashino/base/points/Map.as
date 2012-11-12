package bitrise.prostokvashino.base.points
{
	import bitrise.core.format.json.JSON;
	import bitrise.core.reflection.Reflection;
	import bitrise.prostokvashino.base.view.iso.Scene;
	
	public class Map
	{
		public var vector:Vector.<RoadBase>;
		public var buildings:Vector.<Building>;
		
		private var _scene:Scene;
		
		public function Map() {
			vector = new Vector.<RoadBase>();
			buildings = new Vector.<Building>();
		}
		
		public function get scene():Scene {
			return _scene;
		}

		public function set scene(value:Scene):void {
			if (_scene) {
				for each(var building:Building in buildings) {
					building.clear(_scene.buildings);
				}
			}
			_scene = value;
			if (_scene) {
				for each(building in buildings) {
					building.draw(_scene.buildings);
				}
			} else {
				for each(building in buildings) {
					building.clear(_scene.buildings);
				}
			}
		}

		public function addRoad(road:RoadBase):RoadBase {
			vector.push(road);
			return road;
		}
		
		public function removeRoad(road:RoadBase):RoadBase {
			const index:int = vector.indexOf(road);
			if (index >= 0) {
				vector.splice(index, 1);
			}
			return road;
		}
		
		public function addBuilding(building:Building):Building {
			buildings.push(building);
			if (_scene) {
				building.draw(_scene.buildings);
			}
			return building;
		}
		
		public function removeBuilding(building:Building):Building {
			const index:int = buildings.indexOf(building);
			if (index != -1) {
				buildings.splice(index, 1);
				if (_scene) {
					building.clear(_scene.buildings);
				}
			}
			return building;
		}
		
		public function free():void {
			while(buildings.length)
				removeBuilding(buildings.pop());
			while(vector.length)
				removeRoad(vector.pop());
		}
		
		public function serealize():String {
			const object:Object = new Object();
			object.roads = [];
			for each(var road:RoadBase in vector) {
				const ro:Object = new Object();
				ro.points = [];
				for each(var point:PointBase in road.vector) {
					ro.points.push({x: point.x, y: point.y, name: point.name});
				}
				object.roads.push(ro);
			}
			object.buildings = [];
			for each(var building:Building in buildings) {
				object.buildings.push({x: building.x, y: building.y, name: building.name, source: Reflection.getClassName(building.sprite.source)});
			}
			return JSON.encode(object);
		}
		
		public function deserialize(json:String):void {
			free();
			const object:Object = JSON.decode(json);
			for each(var building:Object in object.buildings) {
				const b:Building = createBuilding(building);
				addBuilding(b);
			}
			for each(var road:Object in object.roads) {
				const r:RoadBase = createRoad(road);
				for each(var point:Object in road.points) {
					const p:PointBase = createPoint(point);
					r.addPoint(p);
				}
				addRoad(r);
			}
		}
		
		protected function createBuilding(building:Object):Building {
			const b:Building = new Building(building.source);
			b.name = building.name;
			b.x = building.x;
			b.y = building.y;
			b.apply();
			return b;
		}
		
		protected function createRoad(road:Object):RoadBase {
			const r:RoadBase = new RoadBase();
			return r;
		}
		
		protected function createPoint(point:Object):PointBase {
			const p:PointBase = new PointBase();
			p.name = point.name;
			p.x = point.x;
			p.y = point.y;
			return p;
		}
		
		
	}
}