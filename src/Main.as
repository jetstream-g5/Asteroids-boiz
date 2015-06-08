package 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.events.EventDispatcher;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	/**
	 * ...
	 * @author
	 */
	public class Main extends MovieClip
	{	
		[Embed(source = "../lib/BG1.jpg")]
		public var BG1:Class;
		public var pic:Bitmap = new BG1;
		
		[Embed(source="../lib/BG2.jpg")]
		public var BG2:Class;
		public var pic2:Bitmap = new BG2;
		
		[Embed(source = "../lib/BG3.jpg")] 
		public var BG3:Class;
		public var pic3:Bitmap = new BG3;
		
		[Embed(source = "../lib/BG4.jpg")]
		public var BG4:Class;
		public var pic4:Bitmap = new BG4;
		
		public var BGNumber:Number;
		
		private var bullet:Bullet;
		private var pl:Player;
		private var enemies:Enemy2;
		private var scoreboard:Scoreboard;
		//public var enemy2:Enemy2 = new Enemy2();
		
		public function get deObstacles():Array
		{
			return obstacles;
		}
		
		public function get deBullets():Array
		{
			return bullets;
		}
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			addEventListener(Event.ENTER_FRAME, enemy2Loop);
			//addEventListener(Event.ENTER_FRAME, collisionHandler);
			//addEventListener("removeBullet", removeBullet);
			
			//enemy op het scherm zetten
			//spawnEnemy2();
			
			//framerate is 60
			stage.frameRate = 60;
		}
		
		private function init(e:Event = null):void 
		{
			
			makeBackground();
			
			pl = new Player();
			addChild(pl);
			pl = new Player();
			addChild(pl);
			obstacles = new Array();
			bullets = new Array();
			enemy2 = new Array();
			
			scoreboard = new Scoreboard();
			addChild(scoreboard);
		}
		
		private var obstacles:Array;
		private var bullets:Array;
		private var timer:int = 0;
		private var enemy2:Array;
		
		private function makeBackground():void
		{
			BGNumber =  Math.round(Math.random( )*3);
			
			if (BGNumber == 1)
			{
				if (pic2.stage)
				{
					removeChild(pic2);
				}
				else if (pic3.stage)
				{
					removeChild(pic3);
				}
				else if (pic4.stage)
				{
					removeChild(pic4);
				}
				addChildAt(pic,0);
			}
			
			else if (BGNumber == 2)
			{
				if (pic.stage)
				{
					removeChild(pic);
				}
				else if (pic3.stage)
				{
					removeChild(pic3);
				}
				else if (pic4.stage)
				{
					removeChild(pic4);
				}
				addChildAt(pic2,0);
			}
			
			else if (BGNumber == 2)
			{
				if (pic2.stage)
				{
					removeChild(pic2);
				}
				else if (pic.stage)
				{
					removeChild(pic);
				}
				else if (pic4.stage)
				{
					removeChild(pic4);
				}
				addChildAt(pic3,0);
			}
			
			else
			{
				if (pic.stage)
				{
					removeChild(pic);
				}
				else if (pic2.stage)
				{
					removeChild(pic2);
				}
				else if (pic3.stage)
				{
					removeChild(pic3);
				}
				addChildAt(pic4, 0);
			}
		}
		
		private function onKeyDown(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.SPACE)
			{
				//addEventListener(Event.ENTER_FRAME, loop);
				spawnBullets();
				trace(BGNumber);
			}
		}
		
		private var enemy2Timer:int = 0;
		
		private function enemy2Loop(e:Event):void
		{
			enemy2Timer ++;
			{
				if (enemy2Timer == 60)
				{
					spawnEnemy2();
					enemy2Timer = 0;
					makeBackground();
				}
			}
		}
		
		private function bulletRemove(e:Event):void 
		{
			bullets.splice(0, 1);
		}
		
		private function RipEnemy():void
		{
			//HitTestObject
		}
		
		private function spawnBullets():void
		{
			
			for (var i:int = 0; i < 1; i++)
			{
				bullets.push(new Bullet(pl));
				var newIndex:int = bullets.length -1;
				addChild(bullets[newIndex]);
			}
			
		}
		
		private function spawnEnemy2():void
		{
			
			for (var i:int = 0; i < 1; i++)
			{
				enemy2.push(new Enemy2(pl));
				var newIndex:int = enemy2.length - 1;
				
				addChild(enemy2[newIndex]);
			}
		}
		
	}
	
}