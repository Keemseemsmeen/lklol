

class Master_LOKI_Dialog_Work2
{
	idd = 72003;
	movingEnable = 1;
	controlsBackground[] = {ARS_Moniter,daBackground};
	controls[] = 
	{
		// Main GUI
		daBackground,ARS_Moniter,Header,
		
		// Button Sets
		Version,Home,Admin,Work,Work2,Debug,Cinema,Fun,Exit,Modules,SITCOM,Button3,Testing,		
		
		// Movement
		daMap,Teleport,HALO,HALO_Height,satView,Extraction,Gigan,
		
		// Work2 KeyPad
		BTK,W2_C1_R2,W2_C1_R3,W2_C1_R4,
		LDLsupport,LK,MBG_Create,ION_RTE,

		SPON_MAP,SPON_RearView,CAS,SAM,
				
		// Request Buttons
		Request,Request2,Request3,
		
		// Sides Buttons
		SpawnOmatic,East,veh_East,West,veh_West,RES,veh_RACS,CIVS,veh_Civ,
		RecruitCenter,West2,veh_West2,East2,veh_East2,RES2,veh_RACS2,CIVS2,veh_Civ2,
		
		// Misc
		ListBox

	};

#include "Master_LOKI_Dialog_GUI.hpp"
#include "Master_LOKI_Dialog_Sets.hpp"	
#include "Master_LOKI_Dialog_Move.hpp"
#include "Master_LOKI_Dialog_Keypad_Work2.hpp"
#include "Master_LOKI_Dialog_Request.hpp"			
#include "Master_LOKI_Dialog_Sides.hpp"	




// LAST BRACKET -----------------------------------------------------------------

};