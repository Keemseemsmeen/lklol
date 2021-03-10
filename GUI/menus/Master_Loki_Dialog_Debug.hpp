

class Master_LOKI_Dialog_Debug
{
	idd = 72004;
	movingEnable = 1;
	controlsBackground[] = {ARS_Moniter,daBackground};
	controls[] = 
	{

		// Main GUI
		daBackground,ARS_Moniter,Header,
		
		// ButtonSets
		Version,Home,Admin,Work,Work2,Debug,Cinema,Fun,Exit,Modules,SITCOM,Button3,Testing,	
		
		// Debug Buttons
		fnc_loki_library,cfg_viewer,cfg_Explorer,loki_Debug,locationFinder,Settings,
		FPS,ObjectStatus,unitCounter,order66,TeamStatus
		
		
		
		
	};
	
#include "Master_LOKI_Dialog_GUI.hpp"	
#include "Master_LOKI_Dialog_Keypad_Debug.hpp"
#include "Master_LOKI_Dialog_Sets.hpp"	

	


// LAST BRACKET -----------------------------------------------------------------

};