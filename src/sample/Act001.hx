package sample;

import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;

import flash.text.Font;
import openfl.Assets;
import flash.events.Event;

class Act001 extends Sprite
{

	private var _text:TextField;

	public function new()
	{
		super();

		addEventListener(Event.ADDED_TO_STAGE, added);
	}

	private function added(event:Event)
	{
		removeEventListener(Event.ADDED_TO_STAGE, added);

		var font = Assets.getFont ("font/misaki_mincho.ttf");

		var format:TextFormat = new TextFormat();
		format.align = TextFormatAlign.CENTER;
		format.size = 30;
		format.bold = true;
		format.font = font.fontName;

		_text = new TextField();
// setTextFormat or defaultTextFormat 順番に注意
//		_text.defaultTextFormat = format;
		_text.text = 'z.ohnamiです。\nIs there any problem ？';
		_text.width  = stage.stageWidth;
		_text.height = 60;
		_text.setTextFormat(format);
		_text.textColor = 0x0000FF;

		addChild(_text);

	}
}