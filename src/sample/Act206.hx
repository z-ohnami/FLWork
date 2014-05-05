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
import flash.text.TextFormat;
import flash.text.TextFormatAlign;

import flash.system.Capabilities;

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

		trace(Capabilities.language);

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

		var weatherText:String = "【" + areaName + "】";
		var fastXml = new haxe.xml.Fast(xml);

		for (elem in fastXml.elements) {
			if(elem.name == "pref") {
				for (area in elem.elements) {
					if(area.name == "area" && area.att.id == areaName) {
						for (tag in area.nodes.info) {
							if(tag.name == "info" && tag.att.date == date) {
								weatherText += '\n' + tag.node.weather.innerData + '\n' + tag.node.wave.innerData;
							}
						}
					}
				}

			}
		}

		return weatherText;

	}

	private function getCurrentDate():String
	{
		var timeText:String = DateTools.format(Date.now(),"%Y/%m/%d");
		return timeText;

	}

	private function onComplete(event:Event):Void
	{

		var data:String = cast(event.currentTarget.data, String);
		var xml:Xml = Xml.parse(data).firstElement();

		var font = Assets.getFont ("font/HanaMinA.ttf");

		var format:TextFormat = new TextFormat();
		format.align = TextFormatAlign.CENTER;
		format.size = 20;
		format.bold = true;
		format.font = font.fontName;

		var text:TextField = new TextField();
		text.text = getTodayWeatherText(xml);
		text.width = stage.stageWidth;
		text.textColor = 0x000000;
		text.x = (stage.stageWidth - text.width) / 2;
		text.y = (stage.stageHeight - text.height) / 2;

		text.setTextFormat(format);

		addChild(text);

	}

	private function onLoadError(event:IOErrorEvent):Void
	{
		trace("error occured.");
		trace(event.currentTarget.content);
	}

}
