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
		private var player:Player;
		
		public function Bullet(p:Player)
		{
			player = p;
			
			bullet_Art = new bulletArt();
			this.addChild(bullet_Art);
			bullet_Art.rotation += 90;
			
			this.x = player.x;
			this.y = player.y;
			
			this.rotation = player.rotation;
			
			var r:Number = this.rotation * Math.PI / 180;
			xmove = Math.cos(r);
			ymove = Math.sin(r);
			//trace("xmove",xmove);
			//trace("ymove",ymove);
			
			addEventListener(Event.ENTER_FRAME, update);
			
			
		}
		
		/*var r:Number = bullet_Art.rotation * Math.PI * 180;
		xmove = Math.cos(r);
		ymove = Math.sin(r);*/
		
		
		public function update(e:Event):void
		{
			this.x += xmove * 20;
			this.y += ymove * 20;
		}
		
		
	}

}