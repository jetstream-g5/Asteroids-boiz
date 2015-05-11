package  
{
	import flash.display.MovieClip;
	import flash.ui.Keyboard;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author lorenzo
	 */
	public class Shoot extends MovieClip
	{	
		private var bullet: bulletArt = new bulletArt();
		
		
		public function Shoot() 
		{
			//makeBullet();
			trace("he did something");
			this.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}
		
		public function makeBullet(e:Event)
		{
			
			/*bullet = new Bullet();
			addChild(bullet);
			trace("testmakestuff");*/
		}
		
		private function onKeyDown(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.SPACE)
			{
				trace("pew");
				//makeBullet();
			}
		}
		
	}

}