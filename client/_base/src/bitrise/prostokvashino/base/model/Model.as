package bitrise.prostokvashino.base.model
{
	import bitrise.core.data.MainData;
	import bitrise.prostokvashino.base.model.gui.GUIData;
	import bitrise.prostokvashino.base.model.iso.ISOData;
	import bitrise.prostokvashino.base.model.user.UserData;

	public class Model
	{
		
		public static const GUI:GUIData = new GUIData("gui");
		public static const ISO:ISOData = new ISOData("iso");
		public static const USER_DATA:UserData = new UserData("user");
		
		{
			MainData.instance.addChild(GUI);
			MainData.instance.addChild(ISO);
			MainData.instance.addChild(USER_DATA);
		}
		
	}
}