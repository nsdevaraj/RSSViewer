package com.adams.command
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.commands.SequenceCommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adams.business.RSSFeedDelegate;
	import com.adams.business.Services;
	import com.adams.events.GetFeedsEvent;
	import com.adams.vo.ENumUtil;

	public class GetFeedEntryCommand extends SequenceCommand implements ICommand
	{
		private var rssDelegate:RSSFeedDelegate= new RSSFeedDelegate(ServiceLocator.getInstance().getHTTPService(ENumUtil.RSS_SERVICE));
		override public function execute( event : CairngormEvent ) : void
		{	 
			super.execute(event);
			rssDelegate.invoke();
		} 
	}
}