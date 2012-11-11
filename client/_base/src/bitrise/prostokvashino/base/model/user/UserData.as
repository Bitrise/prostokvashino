package bitrise.prostokvashino.base.model.user
{
	import bitrise.core.data.CatchDataContatiner;
	
	public class UserData extends CatchDataContatiner
	{
		
		public const money:UserItemData = new UserItemData();
		public const scores:UserItemData = new UserItemData();
		
		public function UserData(name:String)
		{
			super();
			this.name = name;
		}
	}
}