package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * ...
	 * @author lorenzo
	 */
	public class Bullet extends MovieClip
	{
		private var bullet_Art:bulletArt;
		
		public function Bullet()
		{
			bullet_Art = new bulletArt();
			
			this.addChild(bullet_Art);
			
			this.y = 300;
			this.x = 350; 
			
			this.addEventListener(Event.ENTER_FRAME, loop)
		}
		
		private function loop(e:Event):void 
		{
			this.y -= 10;
		}
		
		
		
	}

}