package bitrise.prostokvashino.base.points
{
	import flash.display.Sprite;

	public class Building extends PointBase
	{
		
		public var sprite:BuildingSprite;
		
		public function Building(source:Object)
		{
			super();
			sprite = new BuildingSprite(this);
			sprite.source = source;
		}
		
		override public function move(x:Number, y:Number):void {
			super.move(x, y);
			apply();
		}
		
		public function apply():void {
			sprite.x = x;
			sprite.y = y;
		}
		
		public function draw(display:Sprite):void {
			display.addChild(sprite);
		}
		
		public function clear(display:Sprite):void {
			display.removeChild(sprite);
		}
	}
}