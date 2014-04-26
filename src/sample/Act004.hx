
package sample;

import flash.display.Sprite;
import flash.events.Event;

import flash.display.BitmapData;
import flash.display.Bitmap;
import openfl.Assets;

class Act004 extends Sprite
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

		_bmpData = Assets.getBitmapData ("img/my-kamon1.png");
		_bmp = new Bitmap(_bmpData);
		_bmp.scaleX = 0.5;
		_bmp.scaleY = 0.5;
		_bmp.x = (stage.stageWidth  - _bmp.width) / 2;
		_bmp.y = (stage.stageHeight - _bmp.height) / 2;
		// _bmp.x = (stage.stageWidth) / 2;
		// _bmp.y = (stage.stageHeight) / 2;

		addChild(_bmp);

	}


}
