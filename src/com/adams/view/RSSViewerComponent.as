package com.adams.view
{
	
	import com.adobe.cairngorm.control.CairngormEventDispatcher;
	import com.adams.events.GetFeedsEvent;
	import com.adams.model.RSSModel;
	
	import flash.events.Event;
	
	import spark.components.supportClasses.SkinnableComponent;
	
	
	public class RSSViewerComponent extends SkinnableComponent
	{
		[Bindable]
		public var model:RSSModel = RSSModel.getInstance();
		public function RSSViewerComponent()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE,getLatestFeeds,false,0,true);
		}
		
		public function getLatestFeeds(event:Object=null):void
		{
			model.rssURL = RSSViewerSkin(skin).sourceUrl.text;
			var getfeeds:GetFeedsEvent = new GetFeedsEvent(GetFeedsEvent.GET_FEEDS);
			CairngormEventDispatcher.getInstance().dispatchEvent(getfeeds);
			//http://blog.metservice.com/feed/rss/
		}
		
		override protected function getCurrentSkinState():String
		{
			return super.getCurrentSkinState();
		} 
		
		override protected function partAdded(partName:String, instance:Object) : void
		{
			super.partAdded(partName, instance);
		}
		
		override protected function partRemoved(partName:String, instance:Object) : void
		{
			super.partRemoved(partName, instance);
		}
		
	}
}