package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author lorenzo Kappa
	 */
	public class Main extends MovieClip
	{
		private var bullet:Bullet;
		public var player:MovieClip;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(Event.ENTER_FRAME, loop);
			
			stage.frameRate = 60;
		}
		
		private function init(e:Event = null):void 
		{
			player = new Player();
			addChild(player);
		}
		
		private function loop(e:Event)
		{
			var l:int = player.bullets.length;
			for (var i:int = 0; i < l; i++ )
			{
				player.bullets[i].update();
			}
			
		}
		
	}
	
}