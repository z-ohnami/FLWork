package sample;

import flash.display.Sprite;
import flash.text.TextField;
import flash.events.Event;
import flash.Vector;

class Act002 extends Sprite
{

	private var _text:TextField;
	private var _rect:Sprite;
	private var _circle:Sprite;
	private var _triangle:Sprite;

	public function new() 
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init(event:Event)
	{
		removeEventListener(Event.ADDED_TO_STAGE, init);

		var posY:Float = 50;

		//draw rect
		_rect = new Sprite();
		_rect.graphics.beginFill(0xFF0000);
		_rect.graphics.drawRect(0,0,100,100);
		_rect.graphics.endFill();

		_rect.x = (stage.stageWidth - _rect.width) / 2;
		_rect.y = posY;

		addChild(_rect);
		posY += 120;

		//draw circle
		_circle = new Sprite();
		_circle.graphics.beginFill(0x00FF00);
		_circle.graphics.drawCircle(0,0,50);
		_circle.graphics.endFill();
		_circle.x = stage.stageWidth / 2;
		_circle.y = posY + (_circle.height / 2);

		addChild(_circle);

		posY += 120;

		//draw triangle
		var vertices = new Vector<Float> ();
		vertices[0] =  50;
		vertices[1] =   0;
		vertices[2] =   0;
		vertices[3] = 100;
		vertices[4] = 100;
		vertices[5] = 100;

		_triangle = new Sprite();
		_triangle.graphics.beginFill(0x0000FF);
		_triangle.graphics.drawTriangles(vertices);
		_triangle.graphics.endFill();

		_triangle.x = (stage.stageWidth - _triangle.width) / 2;
		_triangle.y = posY;

		addChild(_triangle);

	}
}