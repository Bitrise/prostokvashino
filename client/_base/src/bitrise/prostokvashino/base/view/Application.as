package bitrise.prostokvashino.base.view
{
	import bitrise.prostokvashino.base.model.Model;
	
	import spark.components.Application;

	public class Application extends spark.components.Application
	{
		
		public static var instance:bitrise.prostokvashino.base.view.Application;
		public static var main:View;
		
		public function Application()
		{
			super();
			instance = this;
		}
		
		override protected function createChildren():void {
			super.createChildren();
			main = new View();
			addElement(main);
		}
	}
}