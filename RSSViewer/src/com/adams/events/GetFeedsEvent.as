package com.adams.events
{
	import com.adobe.cairngorm.control.CairngormEvent;
	
	public class GetFeedsEvent extends CairngormEvent
	{
		public static const GET_FEEDS:String='getRSSFeeds';
		public function GetFeedsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}