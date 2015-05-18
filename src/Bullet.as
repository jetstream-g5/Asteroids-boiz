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
		private var xmove:Number;
		private var ymove:Number;
		
		public function Bullet()
		{
			bullet_Art = new bulletArt();
			addChild(bullet_Art);
			
		}
		
		var r:Number = bullet_Art.rotation * Math.PI * 180;
		xmove = Math.cos(r);
		ymove = Math.sin(r);
		
		public function update():void
		{
			this.x += xmove * 20;
			this.y += ymove * 20;
		}
		
		
	}

}