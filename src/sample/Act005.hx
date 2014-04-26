
package sample;

import flash.display.Sprite;
import flash.events.Event;

import flash.display.BitmapData;
import flash.display.Bitmap;
import openfl.Assets;

class Act005 extends Sprite
{

	private var _bmpData:BitmapData;
	private var _bmp:Bitmap;
	private var _sprite:Sprite;

	public function new() 
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, init);
	}

	private function init(event:Event)
	{
		removeEventListener(Event.ADDED_TO_STAGE, init);

		_sprite = new Sprite();

		_bmpData = Assets.getBitmapData ("img/my-kamon1.png");
		_bmp = new Bitmap(_bmpData);

		_sprite.x = (stage.stageWidth) / 2;
		_sprite.y = (stage.stageHeight) / 2;

		_bmp.scaleX = 0.5;
		_bmp.scaleY = 0.5;
		_bmp.x = -(_bmp.width / 2);
		_bmp.y = -(_bmp.height / 2);

		_sprite.rotation = 45;

		_sprite.addChild(_bmp);
		addChild(_sprite);

	}


}
