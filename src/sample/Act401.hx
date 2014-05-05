
package sample;

import flash.display.Sprite;
import flash.events.Event;

import flash.display.BitmapData;
import flash.display.Bitmap;
import openfl.Assets;

import motion.Actuate;
import motion.easing.Quad;

class Act401 extends Sprite
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

		trace("called 401");

		removeEventListener(Event.ADDED_TO_STAGE, init);

		_bmpData = Assets.getBitmapData ("img/my-kamon1.png");
		_bmp = new Bitmap(_bmpData);
		// _bmp.scaleX = 0.5;
		// _bmp.scaleY = 0.5;
		// _bmp.x = (stage.stageWidth  - _bmp.width) / 2;
		// _bmp.y = (stage.stageHeight - _bmp.height) / 2;
		_bmp.x = 0;
		_bmp.y = 0;

		addChild(_bmp);

//		playTween();

	}

	private function playTween():Void
	{
//		Actuate.tween(_bmp, 1, {x: 0,y:0 }).tween (_bmp, 1, { alpha: 0 });
		Actuate.tween(_bmp, 1, {x: 0, y:0 }).ease(Quad.easeInOut);
//		Actuate.tween(_bmp, 3, { alpha: 0 });

//		Actuate.tween (_bmp, 1, { rotation: 180 }).smartRotation ();

	}

}
