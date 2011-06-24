package com.adams.model
{
	import com.adobe.cairngorm.model.IModelLocator;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class RSSModel implements IModelLocator
	{
		private static var instance : RSSModel;
		
		public static function getInstance() : RSSModel
		{
			if(instance == null) instance = new RSSModel();
			return instance;
		}
		
		public function RSSModel()
		{
			if(instance != null) throw new Error("Error: Singletons can only be instantiated via getInstance() method!");
			RSSModel.instance = this;
		} 
		
		public var rssURL:String;
		public var rssFeedCollection:ArrayCollection = new ArrayCollection();
	}
}