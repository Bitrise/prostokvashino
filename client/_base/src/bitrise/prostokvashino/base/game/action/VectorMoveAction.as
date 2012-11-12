package bitrise.prostokvashino.base.game.action
{
	import bitrise.core.utils.GeomUtils;
	import bitrise.prostokvashino.base.game.GameCar;
	import bitrise.prostokvashino.base.points.PointBase;
	
	import flash.geom.Point;

	public class VectorMoveAction extends ActionBase
	{
		
		public var length:Number = 0;
		public var current:Number = 0;
		public var index:uint = 0;
		public var vector:Vector.<PointBase>;
		public var distance:Number = 0;
		public var oldPoint:PointBase;
		public var newPoint:PointBase;
		
		public function VectorMoveAction(vector:Vector.<PointBase>)
		{
			super();
			var old:PointBase;
			for each(var point:PointBase in vector) {
				if (old) {
					length += GeomUtils.lineLength(point.x, point.y, old.x, old.y);
				}
				old = point;
			}
			this.vector = vector;
		}
		
		private var internalPoint:Point = new Point();
		
		override public function renderer(car:GameCar, delta:uint):uint {
			if (length == 0)
				return delta;
			
			const next:Number = car.speed * (delta / 1000);
			current += next;
			if (distance > current) {
				internalPoint.x = newPoint.x - oldPoint.x;
				internalPoint.y = newPoint.y - oldPoint.y;
				internalPoint.normalize(next);
				car.move(car.x + internalPoint.x, car.y + internalPoint.y);
				return 0;
			} else if (distance <= current) {
				index += 1;
				if (index >= vector.length) {
					return delta;
				}
				oldPoint = vector[index - 1];
				newPoint = vector[index];
				internalPoint.x = newPoint.x - oldPoint.x;
				internalPoint.y = newPoint.y - oldPoint.y;
				car.carSprite.direction(internalPoint.x, internalPoint.y);
				car.move(oldPoint.x, oldPoint.y);
				const diff:Number = current - distance;
				distance = GeomUtils.lineLength(oldPoint.x, oldPoint.y, newPoint.x, newPoint.y);
				current = 0;
				return renderer(car, diff * 1000 / car.speed);
			}
			return delta;
		}
		
		
	}
}