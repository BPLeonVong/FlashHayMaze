package  
{
	
	import flash.display.MovieClip;
	public class VActor extends MovieClip 
	{
		public function VActor() 
		{
		}
				
		//Processes that are neither dead or alive
		public static const UNINITIALIZED:	String = "UNINITIALIZED"; 	//Created but not running
		public static const REMOVED:		String = "REMOVED"; 		//removed from list but not destroyed
		
		//Living Processes
		public static const RUNNING:		String = "RUNNING"; 		//initialized and running
		public static const PAUSED:			String = "PAUSED"; 			//initialied but stalled
		
		//Dead Processes
		public static const SUCCEEDED:		String = "SUCCEEDED"; 		//completed successfully
		public static const FAILED:			String = "FAILED"; 			//failed to complete
		public static const ABORTED:		String = "ABORTED"; 		//aborted may not have started
		
		public static var	PSTATE:			String;						//State of process
		
		public function VProcess() 
		{
			PSTATE = UNINITIALIZED;
			HumanView.ProcessManager.ProcessList.push(this);
		}
		
		public function VOnInit(){PSTATE = RUNNING;}
		public function VOnUpdate(deltaMS){};
		public function VOnSuccess(){}
		public function VOnFail(){}
		public function VOnAbort(){}
		
		public function Succeed(){}
		public function Fail(){}
		public function Pause(){}
		public function UnPause(){}
		
		public function GetState():String{return PSTATE;}
		
		public function IsAlive():Boolean{return (PSTATE == RUNNING || PSTATE == PAUSED);}
		
		public function IsDead():Boolean{return (PSTATE == SUCCEEDED || PSTATE == FAILED || PSTATE == ABORTED);}
		
		public function IsRemoved():Boolean{return (PSTATE == REMOVED);}
		
		public function IsPaused():Boolean{return (PSTATE == PAUSED);}
	
		public function SetState(m_PState:String){PSTATE = m_PState;}
	}
}
