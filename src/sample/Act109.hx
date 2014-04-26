package sample;

import flash.display.Sprite;
import flash.text.TextField;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.Vector;

class Act109 extends Sprite
{

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
		_rect.graphics.beginFill(getNextColor());
		_rect.graphics.drawRect(0,0,100,100);
		_rect.graphics.endFill();

		_rect.x = (stage.stageWidth - _rect.width) / 2;
		_rect.y = (stage.stageHeight - _rect.height) / 2;

		addChild(_rect);

		_rect.addEventListener(MouseEvent.CLICK,onClick);

	}

	private function  onClick(event:MouseEvent)
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
			trace('青色になりました。');
		} else {
			color = 0xFF0000;
			_toggle = true ;
			trace('赤色になりました。');
		}

		return color;
	}

}