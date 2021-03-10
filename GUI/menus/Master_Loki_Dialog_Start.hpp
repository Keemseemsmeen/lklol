

class Master_Loki_Dialog_Start
{
	idd = 72000;
	movingEnable = 1;
	controlsBackground[] = {ARS_Moniter,daBackground};
	controls[] = 
	{
		// Main GUI
		daBackground,loki,ARS_Moniter,Header,
		
		// ButtonSets
		Version,Home,Admin,Work,Work2,Debug,Cinema,Fun,Exit,Modules,SITCOM,Button3,Testing,Key_Color,
		
		// Home
		About,howTo,knownIssues,credits
		
		
		
		
	};
	
#include "Master_LOKI_Dialog_GUI.hpp"		
#include "Master_LOKI_Dialog_Sets.hpp"
#include "Master_LOKI_Dialog_Home.hpp"




	class Key_Color : LOKI_RscButton
	{
	idc = 72112;
	x = 0.715;
	y = 0.880;
	w = 0.070;
	h = 0.060;
	text = "Key Color";
    sizeEx = 0.020;
	action = "[72000] execVM '\loki_lost_key\GUI\scripts\Color_Settings.sqf'";

	};		
	


// LAST BRACKET -----------------------------------------------------------------

};