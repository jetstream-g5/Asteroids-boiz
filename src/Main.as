package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	/**
	 * ...
	 * @author lorenzo Kappa
	 */
	public class Main extends MovieClip
	{
		private var bullet:Bullet;
		private var player:MovieClip;
		private var obstacles:Array;
		
		public function get deObstacles():Array
		{
			return obstacles;
		}
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}
		
		private function init(e:Event = null):void 
		{
			player = new Player();
			addChild(player);
			obstacles = new Array();
		}
		
		private function onKeyDown(e:KeyboardEvent):void
		{
			
			if (e.keyCode == Keyboard.SPACE)
			{
				trace("space");
				spawnBullets();
			}
		}
		
		private function spawnBullets():void
		{
			
			for (var i:int = 0; i < 0; i++)
			{
				obstacles.push(new Bullet);
				var newIndex:int = obstacles.length - 1;
				addChild(obstacles[newIndex]);
			}
		
		}
	}
	
}