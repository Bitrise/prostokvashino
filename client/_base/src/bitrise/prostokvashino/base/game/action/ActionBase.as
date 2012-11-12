package bitrise.prostokvashino.base.game.action
{
	import bitrise.prostokvashino.base.game.GameCar;

	public class ActionBase
	{
		public function ActionBase()
		{
		}
		
		public function renderer(car:GameCar, delta:uint):uint {
			return 0;
		}
	}
}