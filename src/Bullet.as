package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	/**
	 * ...
	 * @author
	 */
	public class Bullet extends MovieClip
	{
		private var bullet_Art:bulletArt;
		private var xmove:Number;
		private var ymove:Number;
		private var pl:Player;
		private var timer:Timer;
		public static const REMOVE_BULLET: String = "removeBullet";
		
		
		
		public function Bullet(p:Player)
		{
			pl = p;
			timer = new Timer(1000, 1);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, handleTimer);
			timer.start();
			bullet_Art = new bulletArt();
			this.addChild(bullet_Art);
			
			this.scaleX = 0.1;
			this.scaleY = 0.1;
			this.x = pl.x;
			this.y = pl.y;
			
			this.rotation = pl.rotation;
			
			var r:Number = this.rotation * Math.PI / 180;
			xmove = Math.cos(r);
			ymove = Math.sin(r);
			
			addEventListener(Event.ENTER_FRAME, update);	
		}
		
		public function Destroy():void
		{
			removeEventListener(Event.ENTER_FRAME, update);
		}
		
		private function handleTimer(e:TimerEvent):void 
		{
			dispatchEvent(new Event(REMOVE_BULLET, true));
		}
		
		private function update(e:Event):void
		{
			this.x += xmove * 20;
			this.y += ymove * 20;
			
			if (this.x > stage.stageWidth)
			{
				this.x = 0;
			}
			else if (this.x < -60)
			{
				this.x = stage.stageWidth;
			}
			else if (this.y > stage.stageHeight)
			{
				this.y = 0;
			}
			else if (this.y < -60)
			{
				this.y = stage.stageHeight;
			}
		}
		
		
	}

}