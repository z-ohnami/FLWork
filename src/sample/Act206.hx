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


class Act206 extends Sprite
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

		var requestUrl:String = "http://www.drk7.jp/weather/xml/13.xml";

		var loader = new URLLoader();
		loader.addEventListener(Event.COMPLETE, onComplete);
		loader.addEventListener(IOErrorEvent.IO_ERROR, onLoadError);
		loader.load(new URLRequest(requestUrl));

	}

	private function getTodayWeatherText(xml:Xml):String
	{
		var areaName:String = '東京地方';
		var date:String = getCurrentDate();

		var weather:Xml = Xml.createDocument();

		for (pref in xml.elementsNamed("pref")) {
			for (area in pref.elementsNamed("area")) {
				if(area.get("id") == areaName) {
					for (info in area.elementsNamed("info")) {
						if(info.get("date") == date) {
							weather = info;
							break;
						}
					}
				}
			}
		}

		var condition:String = "";
		var wave:String = "";

		for (node in weather) {
			var nodeName:String = node.nodeName;
			if(nodeName == "weather") {
				condition = node.nodeValue;
			}
			if(nodeName == "wave") {
				wave = node.nodeValue;
			}
		}

		return areaName + ' : \n ' + condition + ' ' + wave;

//		return areaName + ' : \n ' + w.elementsNamed("weather").firstElement().nodeValue + ' ' + w.elementsNamed("wave").nodeValue;
//		return areaName + ' : \n ' + w.weather + ' ' + w.elementsNamed("wave").firstChild().nodeValue();
	}

	private function getCurrentDate():String
	{
		var timeText:String = DateTools.format(Date.now(),"%Y/%m/%d");
		return timeText;

	}

	private function onComplete(event:Event):Void
	{
		trace("loaded" + cast(event.currentTarget.data, String));

		var data:String = cast(event.currentTarget.data, String);
		var xml:Xml = Xml.parse(data).firstElement();

		var text:TextField = new TextField();
		text.text = getTodayWeatherText(xml);
		text.width = 200;
		text.x = (stage.stageWidth - text.width) / 2;
		text.y = (stage.stageHeight - text.height) / 2;
		addChild(text);

	}

	private function onLoadError(event:IOErrorEvent):Void
	{
		trace("error occured.");
		trace(event.currentTarget.content);
	}

}
