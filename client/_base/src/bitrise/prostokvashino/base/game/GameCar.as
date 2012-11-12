package bitrise.prostokvashino.base.game
{
	import bitrise.prostokvashino.base.game.action.ActionBase;
	import bitrise.prostokvashino.base.points.Building;
	import bitrise.prostokvashino.base.points.PointBase;
	
	import flash.display.Sprite;
	
	public class GameCar extends PointBase
	{
		
		public var carSprite:CarSprite;
		public var actions:Vector.<ActionBase> = new Vector.<ActionBase>();
		public var speed:uint = 30;
		
		public function GameCar(top:Class, bottom:Class)
		{
			super();
			carSprite = new CarSprite(top, bottom);
		}
		
		override public function move(x:Number, y:Number):void {
			super.move(x, y);
			carSprite.x = x;
			carSprite.y = y;
		}
		
		public function render(delta:uint):void {
			if (actions.length) {
				do {
					delta = actions[0].renderer(this, delta);
					if (delta != 0)
						actions.shift();
				} while(delta != 0 && actions.length > 0);
			}
		}
	}
}