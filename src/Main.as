package 
{
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
		
		private function onKeyDown(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.SPACE)
			{
				//addEventListener(Event.ENTER_FRAME, loop);
				spawnBullets();
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