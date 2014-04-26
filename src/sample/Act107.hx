package sample;

import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;
import flash.events.Event;
import flash.events.TimerEvent;
import flash.utils.Timer;

class Act107 extends Sprite
{

	private var _text:TextField;
	private var _timer:Timer;

	public function new() 
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, init);
	}

	private function init(event:Event)
	{
		removeEventListener(Event.ADDED_TO_STAGE, init);

		var format:TextFormat = new TextFormat();
		format.align = TextFormatAlign.CENTER;
		format.size = 30;
		format.bold = true;

		_text = new TextField();
		_text.defaultTextFormat = format;

		_text.text = setCurrentTimeText();
		_text.textColor = 0x000000;
		_text.width = 200;

		_text.x = (stage.stageWidth - _text.width) / 2;
		_text.y = (stage.stageHeight - _text.height) / 2;

		addChild(_text);

		_timer = new Timer(1000);
		_timer.addEventListener(TimerEvent.TIMER,onTimer);
		_timer.start();
	}

	private function onTimer(event:TimerEvent):Void
	{
		_text.text = setCurrentTimeText();

	}

	private function setCurrentTimeText():String
	{

//		var date:Date = Date.now();
//		var timeText:String = date.getHours() + ':' + date.getMinutes() + ':' + date.getSeconds();
		var timeText:String = DateTools.format(Date.now(),"%H:%M:%S");

		return timeText;
	}

}
