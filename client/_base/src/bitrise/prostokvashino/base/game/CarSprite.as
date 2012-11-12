package bitrise.prostokvashino.base.game
{
	import flash.display.Sprite;
	import flash.geom.Point;

	public class CarSprite extends Sprite
	{
		
		public var sprite:Sprite;
		private var top:Class;
		private var bottom:Class;
		
		public function CarSprite(top:Class, bottom:Class)
		{
			sprite = new Sprite();
			this.top = top;
			this.bottom = bottom;
			addChild(sprite);
		}
		
		public function direction(x:Number, y:Number):void
		{
			while(sprite.numChildren) {
				sprite.removeChildAt(0);
			}
			
			if (x >= 0 && y >= 0) {
				sprite.addChild(new top);
				sprite.scaleX = 1;
			} else if (x < 0 && y > 0) {
				sprite.addChild(new top);
				sprite.scaleX = -1;
			} else if (x <= 0 && y <= 0) {
				sprite.addChild(new bottom);
				sprite.scaleX = 1;
			} else if (x > 0 && y < 0) {
				sprite.addChild(new bottom);
				sprite.scaleX = -1;
			}
			sprite.x = -sprite.width * sprite.scaleX  / 2;
			sprite.y = -sprite.height / 2;
		}
	}
}