package bitrise.prostokvashino.base.points
{
	
	public class Map
	{
		public var vector:Vector.<RoadBase>;
		
		public function Map() {
			vector = new Vector.<RoadBase>();
		}
		
		public function addRoad(road:RoadBase):RoadBase {
			vector.push(road);
			return road;
		}
		
		public function addRoadAt(road:RoadBase, index:uint):RoadBase {
			vector.splice(index, 0, road);
			return road;
		}
		
		public function removeRoad(road:RoadBase):RoadBase {
			const index:int = vector.indexOf(road);
			if (index >= 0) {
				vector.splice(index, 1);
			}
			return road;
		}
		
		public function removeRoadAt(index:uint):RoadBase {
			const road:RoadBase = vector[index];
			if (road) {
				vector.splice(index, 1);
			}
			return road;
		}
		
		
		
	}
}