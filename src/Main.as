package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author lorenzo
	 */
	public class Main extends MovieClip
	{
		
		private var player:MovieClip;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			player = new Player();
			addChild(player);
			
			if (contains(player))
			{
				//trace("ik ben er");
			}
		}
		
	}
	
}