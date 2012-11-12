package bitrise.prostokvashino.base.points
{

	public class RoadBase
	{
		
		public var vector:Vector.<PointBase>;
		
		public function RoadBase() {
			vector = new Vector.<PointBase>
		}
		
		public function addPoint(point:PointBase):PointBase {
			vector.push(point);
			return point;
		}
		
		public function addPointAt(point:PointBase, index:uint):PointBase {
			vector.splice(index, 0, point);
			return point;
		}
		
		public function removePoint(point:PointBase):PointBase {
			const index:int = vector.indexOf(point);
			if (index >= 0) {
				vector.splice(index, 1);
			}
			return point;
		}
		
		public function removePointAt(index:uint):PointBase {
			const point:PointBase = vector[index];
			if (point) {
				vector.splice(index, 1);
			}
			return point;
		}
		
	}
}