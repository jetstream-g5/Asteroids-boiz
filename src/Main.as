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
		public static var player:Player;
		private var enemies:Enemy;
		public var enemy2:Enemy2 = new Enemy2();
		
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
			addEventListener(Event.ENTER_FRAME, loop);
			//addEventListener("removeBullet", removeBullet);
			
			//enemy op het scherm zetten
			addChild(enemy2);
			
			//framerate is 60
			stage.frameRate = 60;
		}
		
		private function init(e:Event = null):void 
		{
			
			makeBackground();
			
			player = new Player();
			addChild(player);
			obstacles = new Array();
			bullets = new Array();
		}
		
		private var obstacles:Array;
		private var bullets:Array;
		private var timer:int = 0;
		
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
				addEventListener(Event.ENTER_FRAME, loop);
				spawnBullets();
				makeBackground();
			}
		}
		
		
		private function loop(e:Event):void
		{
			/*timer++;
			var b:Array = deBullets;
			/if (timer > 30)
			{
				b.splice(0, 1);
				timer = 0;
			}*/
			stage.addEventListener(Bullet.REMOVE_BULLET, bulletRemove);
			enemy2.vit.dx = player.x - enemy2.x;
			enemy2.vit.dy = player.y - enemy2.y;
			
			//enemy2 speed is 2.5
			enemy2.vit.r = 2.5;
			
			enemy2.x += enemy2.vit.dx;
			enemy2.y += enemy2.vit.dy;
		}
		
		private function bulletRemove(e:Event):void 
		{
			//removeChild(bullets[0]);
			bullets.splice(0, 1);
		}
		
		/*private function removeBullet(event:Event):void
		{
			
			
		}*/
		
		private function spawnBullets():void
		{
			
			for (var i:int = 0; i < 1; i++)
			{
				bullets.push(new Bullet(player));
				var newIndex:int = bullets.length -1;
				
				addChild(bullets[newIndex]);
			}
			
		}
	}
	
}