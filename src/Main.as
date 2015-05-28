package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.events.EventDispatcher;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	/**
	 * ...
	 * @author lorenzo Kappa
	 */
	public class Main extends MovieClip
	{
		private var bullet:Bullet;
		private var player:Player;
		
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
			
			stage.frameRate = 60;
		}
		
		private function init(e:Event = null):void 
		{
			player = new Player();
			addChild(player);
			obstacles = new Array();
			bullets = new Array();
		}
		
		private var obstacles:Array;
		private var bullets:Array;
		private var timer:int = 0;
		
		private function onKeyDown(e:KeyboardEvent):void
		{
				if (e.keyCode == Keyboard.SPACE)
				{
					addEventListener(Event.ENTER_FRAME, loop);
					spawnBullets();
					//trace(timer);
					trace(bullets.length);
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
		}
		
		private function bulletRemove(e:Event):void 
		{
			trace(bullets.length);
			removeChild(bullets[0]);
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
				trace(bullets.length);
			}
			
		}
	}
	
}