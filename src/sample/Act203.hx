package sample;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.IOErrorEvent;

import flash.display.BitmapData;
import flash.display.Bitmap;
import openfl.Assets;

//import flash.display.Loader;
import flash.net.URLLoader;
import flash.net.URLRequest;
import flash.text.TextField;

import haxe.Json;

class Act203 extends Sprite
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

		var requestUrl:String = "http://192.168.24.24/api_json.php";

		var loader = new URLLoader();
		loader.addEventListener(Event.COMPLETE, onComplete);
		loader.addEventListener(IOErrorEvent.IO_ERROR, onLoadError);
		loader.load(new URLRequest(requestUrl));

	}

	private function onComplete(event:Event):Void
	{
		trace("loaded" + cast(event.currentTarget.data, String));

		var data:String = cast(event.currentTarget.data, String);
		var user = Json.parse(data);

		var text:TextField = new TextField();
		text.text = user.name;
		addChild(text);

	}

	private function onLoadError(event:IOErrorEvent):Void
	{
		trace("error occured.");
		trace(event.currentTarget.content);
	}

}
