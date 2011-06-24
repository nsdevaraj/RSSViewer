package com.adams.vo
{
	public class FeedItem
	{
		private var _title:String;
		private var _enclosure:String;
		private var _description:String;
		private var _pubDate:Date;
		private var _link:String;

		public function get link():String
		{
			return _link;
		}

		public function set link(value:String):void
		{
			_link = value;
		}

		public function get title():String
		{
			return _title;
		}
		
		public function set title(value:String):void
		{
			_title = value;
		}
		
		public function get pubDate():Date
		{
			return _pubDate;
		}
		
		public function set pubDate(value:Date):void
		{
			_pubDate = value;
		}
		
		public function get enclosure():String
		{
			return _enclosure;
		}
		
		public function set enclosure(value:String):void
		{
			_enclosure = value;
		}
		
		public function get description():String
		{
			return _description;
		}
		
		public function set description(value:String):void
		{
			_description = value;
		}
		
		public function fill(item:Object):void{
			title = item.title;
			pubDate = new Date(item.pubDate);
			link = item.link;
			description=item.description;
			if( item.enclosure)enclosure = item.enclosure.url;
		}
		
	}
}