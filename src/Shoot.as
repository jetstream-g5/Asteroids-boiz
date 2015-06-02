package  
{
	import flash.display.MovieClip;
	import flash.ui.Keyboard;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author 
	 */
	public class Shoot extends MovieClip
	{	
		public var bullets:Array = [];
		private var bullet: bulletArt = new bulletArt();
		
		public function Shoot() 
		{
			trace("he did something");
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			//stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			
			bullets = new Array();
		}
		
		
	}

}