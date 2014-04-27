package sample;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.IOErrorEvent;

import flash.display.BitmapData;
import flash.display.Bitmap;
import openfl.Assets;

import flash.display.Loader;
import flash.net.URLRequest;

class Act201 extends Sprite
{
	private var _bmpData:BitmapData;
	private var _bmp:Bitmap;

	public function new() 
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, init);
	}

	private function init(event:Event)
	{
		removeEventListener(Event.ADDED_TO_STAGE, init);

//		var requestUrl:String = "img/my-kamon1.png";
//		var requestUrl:String = "http://192.168.24.24/img/my-kamon1.png";
		var requestUrl:String = "http://192.168.24.24/img/hana.jpg";

		var loader = new Loader();
		loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
		loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onLoadError);
		loader.load(new URLRequest(requestUrl));

	}

	private function onComplete(event:Event):Void
	{
		trace("loaded");
		_bmpData = cast(event.currentTarget.content, Bitmap).bitmapData;
		_bmp = new Bitmap(_bmpData);
		_bmp.x = (stage.stageWidth  - _bmp.width) / 2;
		_bmp.y = (stage.stageHeight - _bmp.height) / 2;

		addChild(_bmp);

	}

	private function onLoadError(event:IOErrorEvent):Void
	{
		trace("error occured.");
		trace(event.currentTarget.content);
	}

}
