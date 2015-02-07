package  
{
	import flash.media.Sound;
	import flash.events.Event;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;

	//audio playback and management
	public class Audio 
	{
		private var m_bgSound:BGSound;
		private var m_SoundChannel:SoundChannel;
		private var volume:Number = 1;
		
		public function Audio()
		{
			m_bgSound = new BGSound();
			m_bgSound.addEventListener(Event.COMPLETE, onSoundLoad); 
			m_SoundChannel = m_bgSound.play();
		}
		
		private function onSoundLoad(e:Event):void 
		{ 
			trace("sound loaded"); 
		}
		private function SetVolume(m_SetValue)
		{
			m_SoundChannel.soundTransform = new SoundTransform(volume,m_SetValue);
		}
	}	
}
