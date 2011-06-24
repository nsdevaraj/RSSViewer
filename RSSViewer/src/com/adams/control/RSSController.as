package com.adams.control
{
	import com.adobe.cairngorm.control.FrontController;
	import com.adams.command.GetFeedEntryCommand;
	import com.adams.events.GetFeedsEvent;
	
	public class RSSController extends FrontController
	{
		public function RSSController()
		{
			super();
			addCommand(GetFeedsEvent.GET_FEEDS, GetFeedEntryCommand);
		}
	}
}