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
			addEventListener(Event.ENTER_FRAME, gameLoop);
			//addEventListener(Event.ENTER_FRAME, collisionHandler);
			addEventListener("removeBullet", removeBullet);
			
			//enemy op het scherm zetten
			//spawnEnemy2();
			
			//framerate is 60
			stage.frameRate = 60;
		}
		
		private function init(e:Event = null):void 
		{
			restart();
		}
		
		private function restart():void
		{		
			makeBackground();
			
			pl = new Player();
			addChild(pl);
			pl = new Player();
			addChild(pl);
			obstacles = new Array();
			bullets = new Array();
			
			scoreboard = new Scoreboard();
			addChild(scoreboard);
		}
		
		private var obstacles:Array;
		private var bullets:Array;
		private var timer:int = 0;
		
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
			}
		}
		
		private var enemy2Timer:int = 0;
		
		private function gameLoop(e:Event):void
		{
			enemy2Timer ++;
			if (enemy2Timer == 60)
			{
				spawnEnemy2();
				enemy2Timer = 0;
				makeBackground();
			}
			hitTestEnemy();
		}
		
		private function destroyBullet(bullet:Bullet):void
		{
			bullet.Destroy();
			bullets.splice(bullets.indexOf(bullet), 1);
			removeChild(bullet);
		}
		
		private function removeBullet(e:Event):void 
		{
			var bullet:Bullet = e.target as Bullet;
			bullet.Destroy();
			bullets.splice(bullets.indexOf(bullet), 1);
			removeChild(bullet);
		}
		
		private function RipEnemy(enemy:Enemy2):void
		{
			enemy.DestroyEnemy();
			obstacles.splice(obstacles.indexOf(enemy), 1);
			removeChild(enemy);
		}
		
		private function hitTestEnemy():void
		{
			for (var i:int = 0; i < obstacles.length; i++)
			{
				var rip:Boolean = false;
				for (var j:int = 0; j < bullets.length; j++)
				{
					if (bullets[j].hitTestObject(obstacles[i]))
					{
						rip = true;
						destroyBullet(bullets[j]);
					}
				}
				
				if (pl.hitTestObject(obstacles[i]))
				{
					rip = true;
				}
				if (rip)
				{
					scoreboard.updateScore(50);
					RipEnemy(obstacles[i]);
				}
			}
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
				obstacles.push(new Enemy2(pl));
				var newIndex:int = obstacles.length - 1;
				
				addChild(obstacles[newIndex]);
			}
		}
		
	}
	
}