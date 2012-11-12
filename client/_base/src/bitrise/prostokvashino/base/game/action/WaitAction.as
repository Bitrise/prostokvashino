package bitrise.prostokvashino.base.game.action
{
	import bitrise.prostokvashino.base.game.GameCar;

	public class WaitAction extends ActionBase
	{
		
		public var wait:int;
		
		public function WaitAction(wait:uint)
		{
			super();
			this.wait = wait;
		}
		
		override public function renderer(car:GameCar, delta:uint):uint {
			wait -= delta;
			if (wait >= 0)
				return 0;
			return Math.abs(wait);
		}
	}
}