package  
{
	
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.display.Sprite;
	import flash.ui.Mouse;
	
	public class HumanView extends MovieClip 
	{
		
		public static var 	tempBut:		StartButton;
		public static var 	tempAI:			Enemy;
		public static var 	ProcessManager:	VProcessManager;
		public static var 	Input:			InputDeviceManager;
		public static var	m_Audio:		Audio;
		public static var	SFactory:		SpriteFactory;
		
		public static var	GCamera:		GameCamera;
		
		
		public function initializeGame() 
		{
			//m_Audio 		= new Audio();
			ProcessManager 	= new VProcessManager();
			Input 			= new InputDeviceManager();
			SFactory		= new SpriteFactory();
			SFactory.addObject(this,0,0,0,SFactory.m_OContainer.m_GS,SFactory.GS);
			SFactory.addObject(SFactory.m_DContainer.m_RGS,0,0,0,SFactory.m_OContainer.m_BG,SFactory.BG);
			SFactory.addObject(SFactory.m_DContainer.m_RGS,0,0,0,SFactory.m_OContainer.m_GA,SFactory.GA);
			SFactory.addObject(this,0,0,0,SFactory.m_OContainer.m_FG,SFactory.FG);
			
			SFactory.addObject(SFactory.m_DContainer.m_RFG,0,0,0,SFactory.m_OContainer.m_MainMenu,SFactory.START);
		
			stage.addEventListener(Event.ENTER_FRAME,VUpdate);
			stage.addEventListener(KeyboardEvent.KEY_DOWN,KeyboardEventCheckDown);
			stage.addEventListener(KeyboardEvent.KEY_UP,KeyboardEventCheckUp);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, MouseEventDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, MouseEventUp);
			stage.addEventListener(MouseEvent.MOUSE_MOVE,MousePosition);
		}
		
		public static function GAMESTART()
		{	
			SFactory.m_DContainer.m_RFG.removeChild(SFactory.m_DContainer.m_RMainMenu);
			SFactory.m_DContainer.m_RMainMenu = null;
			
			SFactory.RenderBackground(SFactory.m_DContainer.m_RBG);
			
			//Generate UI
			SFactory.addObject(SFactory.m_DContainer.m_RFG,650,0,0,SFactory.m_OContainer.m_Restart,SFactory.RESTART);
			SFactory.addObject(SFactory.m_DContainer.m_RFG,850,0,0,SFactory.m_OContainer.m_MapButton,SFactory.OPENMAP);
		
			//Generate Game
			SFactory.addObject(SFactory.m_DContainer.m_RBG,7600,7600,0,SFactory.m_OContainer.m_Goal,SFactory.GOAL); 
			SFactory.addObject(SFactory.m_DContainer.m_RBG,240,240,0,SFactory.m_OContainer.m_Player,SFactory.PLAYER);
			SFactory.m_DContainer.m_Player.width *=2; 
			SFactory.m_DContainer.m_Player.height *=2; 
			
			GCamera	= new GameCamera(SFactory.m_DContainer.m_Player.x,SFactory.m_DContainer.m_Player.y,1280,900);
		}
		
		public static function RESTARTGAME()
		{
			HumanView.SFactory.m_DContainer.SetMap();
			HumanView.SFactory.ReRenderTiles();
		}
		public static function RESETPOSITIONS()
		{
			GCamera.m_Camera.x = 0;
			GCamera.m_Camera.y = 0;
			SFactory.m_DContainer.m_Player.x = 240;
			SFactory.m_DContainer.m_Player.y = 240;
		}
		
		private function KeyboardEventCheckDown(e:KeyboardEvent){Input.KeyboardEventCheckDown(e);}
		
		private function KeyboardEventCheckUp(e:KeyboardEvent){Input.KeyboardEventCheckUp(e);}
		
		private function MouseEventDown(e:MouseEvent){Input.MouseEventDown(e);}
		
		private function MouseEventUp(e:MouseEvent){Input.MouseEventUp(e);}
		
		private function MousePosition(e:MouseEvent):void{Input.MouseHover(e);}//Sets position of Mouse when Move
		
		public function VUpdate(e:Event)
		{
			ProcessManager.UpdateProcesses(0);
		}
				
		
		public function exitApplication()
		{
			stage.removeEventListener(MouseEvent.MOUSE_MOVE,MousePosition);
			stage.removeEventListener(KeyboardEvent.KEY_DOWN,KeyboardEventCheckDown);
			stage.removeEventListener(KeyboardEvent.KEY_UP,KeyboardEventCheckUp);
			stage.removeEventListener(MouseEvent.MOUSE_DOWN, MouseEventDown);
			stage.removeEventListener(MouseEvent.MOUSE_UP, MouseEventUp);
			stage.removeEventListener(Event.ENTER_FRAME,VUpdate);
			StartUpModule.ShutDown();
		}
	}
}