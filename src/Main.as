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
		
		[Embed(source = "../lib/BG3P.png")] 
		public var BG3P:Class;
		public var pic3P:Bitmap = new BG3P;
		
		public var BGNumber:Number;
		
		private var bullet:Bullet;
		private var pl:Player;
		private var enemies:Enemy;
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
<<<<<<< HEAD
			
			makeBackground();
			
			player = new Player();
			addChild(player);
=======
			pl = new Player();
			addChild(pl);
>>>>>>> origin/master
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
		
		private function makeBackground()
		{
			BGNumber =  Math.round(Math.random( )*3);
			
			if (BGNumber == 1)
			{
				if (pic2.stage)
				{
					removeChild(pic2);
				}
				else if (pic3P.stage)
				{
					removeChild(pic3P);
				}
				addChildAt(pic,0);
			}
			
			else if (BGNumber == 2)
			{
				if (pic.stage)
				{
					removeChild(pic);
				}
				else if (pic3P.stage)
				{
					removeChild(pic3P);
				}
				addChildAt(pic2,0);
			}
			
			else
			{
				if (pic2.stage)
				{
					removeChild(pic2);
				}
				else if (pic.stage)
				{
					removeChild(pic);
				}
				addChildAt(pic3P,0);
			}
		}
		
		private function onKeyDown(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.SPACE)
			{
				//addEventListener(Event.ENTER_FRAME, loop);
				spawnBullets();
				makeBackground();
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
				}
			}
		}
		
		private function bulletRemove(e:Event):void 
		{
			bullets.splice(0, 1);
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
			
			for (var i:int = 0; i < 2; i++)
			{
				enemy2.push(new Enemy2(pl));
				var newIndex:int = enemy2.length - 1;
				
				addChild(enemy2[newIndex]);
			}
		}
		
	/*	private function collisionHandler():void
		{
			
		}*/
		
	}
	
}