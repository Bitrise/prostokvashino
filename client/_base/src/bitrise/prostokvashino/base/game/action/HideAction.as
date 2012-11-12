package bitrise.prostokvashino.base.game.action
{
	import bitrise.prostokvashino.base.game.GameCar;

	public class HideAction extends ActionBase
	{
		
		public var delay:int;
		public var all:int;
		
		public function HideAction(delay:uint)
		{
			super();
			this.delay = delay;
			all = delay;
		}
		
		override public function renderer(car:GameCar, delta:uint):uint {
			delay -= delta;
			car.carSprite.alpha = delay / all;
			if (delay >= 0)
				return 0;
			car.carSprite.alpha = 0;
			return Math.abs(delay);
		}
	}
}