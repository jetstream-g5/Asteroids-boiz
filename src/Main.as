package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author lorenzo
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			restart();
		}
		
		private function restart()
		{
			player = new Player();
			addChild(player);
		}
		
	}
	
}