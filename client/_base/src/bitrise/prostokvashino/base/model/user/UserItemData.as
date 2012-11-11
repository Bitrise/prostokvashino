package bitrise.prostokvashino.base.model.user
{
	import bitrise.core.data.CatchDataContatiner;
	import bitrise.core.data.DataEvent;
	
	public class UserItemData extends CatchDataContatiner
	{
		
		private var _count:Number = 0;
		
		[Bindable("change")]
		public function get count():Number {
			return _count;
		}

		public function set count(value:Number):void {
			if (_count == value)
				return;
			const oldValue:Object = _count;
			const newValue:Object = value;
			_count = value;
			if (super.hasEventListener(DataEvent.CHANGE))
				super.dispatchEvent(new DataEvent(DataEvent.CHANGE, [oldValue, newValue]));
		}

	}
}