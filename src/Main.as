package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	
	
	
	/**
	 * ...
	 * @author lorenzo
	 */
	public class Main extends MovieClip
	{
		private var bullet:Bullet;
		
		public var player:MovieClip;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			
			player = new Player();
			addChild(player);
			
		}
		
		
		
	}
	
}