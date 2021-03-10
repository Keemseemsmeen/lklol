

class Master_LOKI_Dialog_Cinema
{
	idd = 72005;
	movingEnable = 1;
	controlsBackground[] = {ARS_Moniter,daBackground};
	controls[] = 
	{
		// Main GUI
		daBackground,ARS_Moniter,Header,
		
		// ButtonSets
		Version,Home,Admin,Work,Work2,Debug,Cinema,Fun,Exit,Modules,SITCOM,Button3,Testing,
		
		// Cinema Buttons
		Clayman,Bulletcam,Spectate,SoundPlayer,Director,
		Intro1,Intro2,Intro3,Intro4,Intro5,Intro6,Intro7,
		Outro1,Outro2,Outro3,Outro4,Outro5,Outro6,Outro7,
		
		Video1,Video2,Video3,Video4,Video5,Custom1,Custom2
		
	};
	

	
	
#include "Master_LOKI_Dialog_GUI.hpp"	
#include "Master_LOKI_Dialog_Keypad_Cinema.hpp"
#include "Master_LOKI_Dialog_Sets.hpp"
	

// INFO BOX ------------------------------------------------------------------------------	
		
		class InfoBox :LOKI_RscListBox
		//class InfoBox : LOKI_RscListBox
	{
		idc = 44;
		x = 0.520; 
		y = 0.140;
		w = 0.380; 
		h = 0.29;
		sizeEx = 0.030;
		rowHeight = 0.030;
		colorText[] = {0,0.72,0.72,1};
		colorBackground[] = {0,0,1,0.72};
		colorSelect[] = {0,0.50,0.50,1};
		colorSelect2[] = {0,1,1,1};
		colorScrollbar[] = {0,0.72,0,1};
		colorSelectBackground[] = {0,0.33,0,0.5};
		colorSelectBackground2[] = {0.2,0.2,0.2,1};
		onLBSelChanged = "[] call LN_ListBoxSel_Info";
	
		soundSelect[] = {"\ca\ui\data\sound\mouse3", 0.2, 1};
		soundExpand[] = {"\ca\ui\data\sound\mouse2", 0.2, 1};
		soundCollapse[] = {"\ca\ui\data\sound\mouse1", 0.2, 1};
	
	};		


// LAST BRACKET -----------------------------------------------------------------

};