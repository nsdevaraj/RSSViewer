package com.adams.business
{
	import com.adams.vo.FeedItem;
	import com.adams.model.RSSModel;
	
	import flash.xml.XMLDocument;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.HTTPService;
	import mx.rpc.xml.SimpleXMLDecoder;
	
	public class RSSFeedDelegate implements IResponder
	{ 
		public var service:HTTPService;
		
		[Bindable]
		private var model:RSSModel = RSSModel.getInstance(); 
		
		public function RSSFeedDelegate(httpService:HTTPService):void{
			service = httpService;
		}
		
		public function invoke(...args) : void
		{ 
			service.url = model.rssURL;
			var call:AsyncToken = service.send();
			call.addResponder( this );
		}
		
		public function result(event:Object):void {
			var result:Object = xmlToObject(service.lastResult as XML)
			model.rssFeedCollection.removeAll();
			for each(var item:Object in result.rss.channel.item){	
				var feeditem:FeedItem = new FeedItem();
				feeditem.fill(item)
				model.rssFeedCollection.addItem(feeditem);
			}
		}
		
		private function xmlToObject( xml:XML ):Object {
			var xmlStr:String = xml.toString();
			var xmlDoc:XMLDocument = new XMLDocument( xmlStr );
			var decoder:SimpleXMLDecoder = new SimpleXMLDecoder( true );
			var obj:Object = decoder.decodeXML( xmlDoc );
			return obj;
		}
		
		public function fault(event:Object):void {
			trace('failure');
		}
		
	}
}