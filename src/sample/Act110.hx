package sample;

import flash.display.Sprite;
import flash.text.TextField;
import flash.events.Event;
import flash.events.TimerEvent;
import flash.utils.Timer;

class Act110 extends Sprite
{

	private var _rect:MyRect;
	private var _timer:Timer;

	public function new()
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, init);
	}

	private function init(event:Event)
	{
		removeEventListener(Event.ADDED_TO_STAGE, init);

		//draw rect
		_rect = new MyRect();
		_rect.x = 0;
		_rect.y = 0;
		addChild(_rect);

		_timer = new Timer(1000);
		_timer.addEventListener(TimerEvent.TIMER,onTimer);
		_timer.start();

	}

	private function onTimer(event:TimerEvent):Void
	{
		_rect.dispatchEvent(new Event(MyRect.EVENT_MOVE));
	}

}

class MyRect extends Sprite
{

	public static inline var EVENT_MOVE:String = 'event_move';

	private var _rect:Sprite;
	private var _toggle:Bool = false;

	public function new()
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, init);
	}

	private function init(event:Event)
	{
		removeEventListener(Event.ADDED_TO_STAGE, init);

		//draw rect
		_rect = new Sprite();
		drawRect();

		addChild(_rect);
		addEventListener(EVENT_MOVE,onReceiveEvent);

	}

	private function onReceiveEvent(event:Event):Void
	{
		x += 10;
		y += 10;
		drawRect();
	}

	private function drawRect():Void
	{
		_rect.graphics.clear();
		_rect.graphics.beginFill(getNextColor());
		_rect.graphics.drawRect(0,0,100,100);
		_rect.graphics.endFill();

	}

	private function getNextColor():UInt
	{
		var color:UInt = 0x000000;

		if(_toggle) {
			color = 0x0000FF;
			_toggle = false ;
//			trace('青色になりました。');
		} else {
			color = 0xFF0000;
			_toggle = true ;
//			trace('赤色になりました。');
		}

		return color;
	}

}