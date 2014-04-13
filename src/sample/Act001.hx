package sample;

import flash.display.Sprite;
import flash.text.TextField;
import flash.events.Event;

/**
 * ...
 * @author 
 */
class Act001 extends Sprite
{

	private var _text:TextField;
	
	public function new() 
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, added);
	}
	
	private function added(event)
	{
		removeEventListener(Event.ADDED_TO_STAGE, added);

		_text = new TextField();
//		_text.text = 'foolay!!';
		_text.text = 'こんにちは';
		_text.textColor = 0x00FF00;
		addChild(_text);

	}
}