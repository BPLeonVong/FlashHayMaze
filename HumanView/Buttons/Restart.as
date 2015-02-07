package  {
	
	import flash.events.MouseEvent;
	
	
	public class Restart extends VButton {
		
		
		public function Restart() {
			super();
		}
		
		override protected function MouseClickFunction(e:MouseEvent) :void
		{
			HumanView.RESTARTGAME();
			HumanView.RESETPOSITIONS();
		}
	}
	
}
