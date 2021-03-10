/////////////////////////////////////////////////////////////////////////
//
//  SIDE MENU
//
/////////////////////////////////////////////////////////////////////////

		class SpawnOmatic: LOKI_RscButton
	{
		idc = 721433; // ahh shit.. label added later.. maybe change to a pic...
		x = 0.960;
		y = 0.110;
		w = 0.150;
		h = 0.050;
		text = "Spawn-O-matic";
		SizeEx = 0.025;

	};	

	
		class West: LOKI_RscButton
	{
		idc = 72143;
		x = 0.935;
		y = 0.155;
		w = 0.075;
		h = 0.050;
		text = "West";
		SizeEx = 0.025;

	};	
	
		class veh_West : LOKI_RscCombo
	{
		idc = 72144;
		x = 0.935;
		y = 0.220;
		w = 0.075;
		h = 0.050; 
		colorText[] = {0,0.72,0.72,1};
		colorBackground[] = {0,0,0,0.72};
		colorSelect[] = {0,0.50,0.50,1};
		colorSelect2[] = {0,1,1,1};
		colorScrollbar[] = {0,0.72,0,1};
		colorSelectBackground[] = {0,0.33,0,0.5};
		colorSelectBackground2[] = {0.2,0.2,0.2,1};
		onLBSelChanged = "(_this + [west]) call Combo_Set";
	
	};	


		class East: LOKI_RscButton
	{
		idc = 72145;
		x = 1.035;
		y = 0.155;
		w = 0.075;
		h = 0.050;
		text = "East";
		SizeEx = 0.025;

	};
	
		class veh_East: LOKI_RscCombo
	{
		idc = 72146;
		x = 1.035;
		y = 0.220;
		w = 0.075;
		h = 0.050;
		colorText[] = {0,0.72,0.72,1};
		colorBackground[] = {0,0,0,0.72};
		colorSelect[] = {0,0.50,0.50,1};
		colorSelect2[] = {0,1,1,1};
		colorScrollbar[] = {0,0.72,0,1};
		colorSelectBackground[] = {0,0.33,0,0.5};
		colorSelectBackground2[] = {0.2,0.2,0.2,1};
		onLBSelChanged = "(_this + [east]) call Combo_Set";

	};		

	
		class RES: LOKI_RscButton
	{
		idc = 72147;
		x = 0.935;
		y = 0.305;
		w = 0.080;
		h = 0.050;
		text = "Guerilla";
		SizeEx = 0.025;
	    action = "";
	};	
	
		class veh_RACS: LOKI_RscCombo
	{
		idc = 72148;
		x = 0.935;
		y = 0.370;
		w = 0.075;
		h = 0.050;
		colorText[] = {0,0.72,0.72,1};
		colorBackground[] = {0,0,0,0.72};
		colorSelect[] = {0,0.50,0.50,1};
		colorSelect2[] = {0,1,1,1};
		colorScrollbar[] = {0,0.72,0,1};
		colorSelectBackground[] = {0,0.33,0,0.5};
		colorSelectBackground2[] = {0.2,0.2,0.2,1};
	onLBSelChanged = "(_this + [resistance]) call Combo_Set";

	};	



		class CIVS: LOKI_RscButton
	{
		idc = 72149;
		x = 1.035;
		y = 0.305;
		w = 0.075;
		h = 0.050;
		text = "Civilians";
		SizeEx = 0.025;
	    action = "";


	};		

		class veh_Civ: LOKI_RscCombo
	{
		idc = 721499;  // oops miss counted.. not renaming 100 things by hand..
		x = 1.035;
		y = 0.370;
		w = 0.075;
		h = 0.050;
		colorText[] = {0,0.72,0.72,1};
		colorBackground[] = {0,0,0,0.72};
		colorSelect[] = {0,0.50,0.50,1};
		colorSelect2[] = {0,1,1,1};
		colorScrollbar[] = {0,0.72,0,1};
		colorSelectBackground[] = {0,0.33,0,0.5};
		colorSelectBackground2[] = {0.2,0.2,0.2,1};
		onLBSelChanged = "(_this + [civilian]) call Combo_Set";

	};	
	
		class RecruitCenter: LOKI_RscButton
	{
		idc = 721434; // ahh shit.. label added later.. maybe change to a pic...
		x = 0.960;
		y = 0.475;
		w = 0.150;
		h = 0.050;
		text = "Recruit Center";
		SizeEx = 0.025;

	};		

		class West2: LOKI_RscButton
	{
		idc = 721435;
		x = 0.935;
		y = 0.510;
		w = 0.075;
		h = 0.050;
		text = "West";
		SizeEx = 0.025;

	};	

		class veh_West2 : LOKI_RscCombo
	{
		idc = 721436;
		x = 0.935;
		y = 0.575;
		w = 0.075;
		h = 0.050; 
		colorText[] = {0,0.72,0.72,1};
		colorBackground[] = {0,0,0,0.72};
		colorSelect[] = {0,0.50,0.50,1};
		colorSelect2[] = {0,1,1,1};
		colorScrollbar[] = {0,0.72,0,1};
		colorSelectBackground[] = {0,0.33,0,0.5};
		colorSelectBackground2[] = {0.2,0.2,0.2,1};
		onLBSelChanged = "(_this + [west]) call Combo_Set2";
	
	};

		class East2: LOKI_RscButton
	{
		idc = 721437;
		x = 1.035;
		y = 0.510;
		w = 0.075;
		h = 0.050;
		text = "East";
		SizeEx = 0.025;

	};
	
		class veh_East2: LOKI_RscCombo
	{
		idc = 721438;
		x = 1.035;
		y = 0.575;
		w = 0.075;
		h = 0.050;
		colorText[] = {0,0.72,0.72,1};
		colorBackground[] = {0,0,0,0.72};
		colorSelect[] = {0,0.50,0.50,1};
		colorSelect2[] = {0,1,1,1};
		colorScrollbar[] = {0,0.72,0,1};
		colorSelectBackground[] = {0,0.33,0,0.5};
		colorSelectBackground2[] = {0.2,0.2,0.2,1};
		onLBSelChanged = "(_this + [east]) call Combo_Set2";

	};	
	
		class RES2: LOKI_RscButton
	{
		idc = 721439;
		x = 0.935;
		y = 0.660;
		w = 0.080;
		h = 0.050;
		text = "Guerilla";
		SizeEx = 0.025;
	    action = "";
	};	
	
		class veh_RACS2: LOKI_RscCombo
	{
		idc = 721440;
		x = 0.935;
		y = 0.725;
		w = 0.075;
		h = 0.050;
		colorText[] = {0,0.72,0.72,1};
		colorBackground[] = {0,0,0,0.72};
		colorSelect[] = {0,0.50,0.50,1};
		colorSelect2[] = {0,1,1,1};
		colorScrollbar[] = {0,0.72,0,1};
		colorSelectBackground[] = {0,0.33,0,0.5};
		colorSelectBackground2[] = {0.2,0.2,0.2,1};
	onLBSelChanged = "(_this + [resistance]) call Combo_Set2";

	};	



		class CIVS2: LOKI_RscButton
	{
		idc = 721441;
		x = 1.035;
		y = 0.660;
		w = 0.075;
		h = 0.050;
		text = "Civilians";
		SizeEx = 0.025;
	    action = "";


	};		

		class veh_Civ2: LOKI_RscCombo
	{
		idc = 721442;  // oops miss counted.. not renaming 100 things by hand..
		x = 1.035;
		y = 0.725;
		w = 0.075;
		h = 0.050;
		colorText[] = {0,0.72,0.72,1};
		colorBackground[] = {0,0,0,0.72};
		colorSelect[] = {0,0.50,0.50,1};
		colorSelect2[] = {0,1,1,1};
		colorScrollbar[] = {0,0.72,0,1};
		colorSelectBackground[] = {0,0.33,0,0.5};
		colorSelectBackground2[] = {0.2,0.2,0.2,1};
		onLBSelChanged = "(_this + [civilian]) call Combo_Set2";

	};	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	