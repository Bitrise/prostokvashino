package bitrise.prostokvashino.base.game.action
{
	import bitrise.prostokvashino.base.game.GameCar;
	import bitrise.prostokvashino.base.model.Model;
	import bitrise.prostokvashino.base.model.user.UserData;

	public class AddScore extends ActionBase
	{
		
		public var score:uint;
		
		public function AddScore(score:uint)
		{
			super();
			this.score = score;	
		}
		
		override public function renderer(car:GameCar, delta:uint):uint {
			Model.USER_DATA.scores.count += score;
			Model.USER_DATA.money.count += uint(score * Math.random());
			return delta;
		}
	}
}