
package sample;

import flash.display.Sprite;
import flash.events.Event;

import flash.display.BitmapData;
import flash.display.Bitmap;
import openfl.Assets;

import flash.geom.Rectangle;
import openfl.display.Tilesheet;

class Act301 extends Sprite
{

	private var _bmpData:BitmapData;
	private var _tileSheet:Tilesheet;

	public function new() 
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, init);
	}

	private function init(event:Event)
	{
		removeEventListener(Event.ADDED_TO_STAGE, init);

		_bmpData = Assets.getBitmapData ("img/301.png");

		_tileSheet = new Tilesheet(_bmpData);
		_tileSheet.addTileRect (new Rectangle (  0,   0, 640, 980));
		_tileSheet.addTileRect (new Rectangle (640,   0, 210, 120));
		_tileSheet.addTileRect (new Rectangle (640, 120, 210, 120));
		_tileSheet.addTileRect (new Rectangle (640, 240, 210, 120));

		// var drawList = [   0,   0, 1, 0.5 ,1,
  //                          5, 200, 1, 0.5 ,1,
  //                        107, 226, 2, 0.5 ,1,
  //                        212, 426, 3, 0.5 ,1];
trace(' Dynamic ');
//		_tileSheet.drawTiles (graphics, drawList, true, Tilesheet.TILE_SCALE,Tilesheet.TILE_ALPHA);
//		_tileSheet.drawTiles (graphics, [   0,   0, 0, 0.5 ,1 ]);
		_tileSheet.drawTiles (graphics, [   0,   0, 0 ]);
		_tileSheet.drawTiles (graphics, [   5, 200, 1 ]);

		var rect:Rectangle = _tileSheet.getTileRect(1);

	}


}
