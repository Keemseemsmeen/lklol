private["_ctrl","_index","_nul","_num"];
// get errors without this - no clue what it *really* does
disableSerialization;
_ctrl = controlNull; _index = 0;
//prevent opening more than one dialog
waitUntil {!dialog};	
	// create dialog
		_nul = createDialog "GZL_DIALOG_DIRECTOR";
		
	// set dialog title
		ctrlSetText [GZL_IDC_LBL_TITLE, format["%1",missionName]];
		
	// set version
		ctrlSetText [GZL_IDC_LBL_VERSION, format["Director %1 - Grizzle (2010)",GZL_DIRECTOR_VERSION]];
		
	// init the subject slider and set its value
		sliderSetRange [GZL_IDC_SLD_SUBJECT_BIAS, 0, 1];
		sliderSetPosition [GZL_IDC_SLD_SUBJECT_BIAS, GZL_SUBJECT_BIAS];
		sliderSetSpeed [GZL_IDC_SLD_SUBJECT_BIAS,1,0.25]; 
		
	// init the acctime slider and set its value
		sliderSetRange [GZL_IDC_SLD_ACCTIME, 0, 4];
		sliderSetPosition [GZL_IDC_SLD_ACCTIME, acctime];
		sliderSetSpeed [GZL_IDC_SLD_ACCTIME,4,1];
	
	// init the preload slider and set its value
		sliderSetRange [GZL_IDC_SLD_PRELOAD, 0, 3];
		sliderSetPosition [GZL_IDC_SLD_PRELOAD, GZL_CAM_PRELOAD];
		sliderSetSpeed [GZL_IDC_SLD_PRELOAD,3,1];
		
	//set lblAccVal value
		_num = [acctime, 2] call GZL_fnc_TrimDecimal;
		ctrlSetText [GZL_IDC_TXT_ACCTIME, str _num];
	
	// set txtSceneLength value	
		ctrlSetText [GZL_IDC_TXT_SCENE_LENGTH, str GZL_SCENE_LENGTH];		
		
	// set Action! button state
		ctrlEnable [GZL_IDC_BTN_ACTION, !GZL_DIRECTOR_ACTIVE];
		
	// set Cut! button state
		ctrlEnable [GZL_IDC_BTN_CUT, GZL_DIRECTOR_ACTIVE];
	
	// set scene fade text
		_ctrl = (findDisplay GZL_IDD_DLG_DIRECTOR) displayCtrl GZL_IDC_BTN_FADE;
		if ( GZL_SCENE_FADE ) then {_ctrl ctrlSetTextColor [1, 1, 1, 1];}
		else {_ctrl ctrlSetTextColor [1, 1, 1, 0.5];};
	
	// set air/no air text
		_ctrl = (findDisplay GZL_IDD_DLG_DIRECTOR) displayCtrl GZL_IDC_BTN_MAN;
		if ('Man' in GZL_VEHICLE_MASK ) then { _ctrl ctrlSetTextColor [1, 1, 1, 1];}
		else {_ctrl ctrlSetTextColor [1, 1, 1, 0.5];};	
	
	// set air/no air text
		_ctrl = (findDisplay GZL_IDD_DLG_DIRECTOR) displayCtrl GZL_IDC_BTN_AIR;
		if ('Air' in GZL_VEHICLE_MASK ) then { _ctrl ctrlSetTextColor [1, 1, 1, 1];}
		else {_ctrl ctrlSetTextColor [1, 1, 1, 0.5];};
		
	// set land/no land text	
		_ctrl = (findDisplay GZL_IDD_DLG_DIRECTOR) displayCtrl GZL_IDC_BTN_LAND;
		if ('LandVehicle' in GZL_VEHICLE_MASK ) then { _ctrl ctrlSetTextColor [1, 1, 1, 1];}
		else { _ctrl ctrlSetTextColor [1, 1, 1, 0.5];};
		
	// set sea/no sea text
		_ctrl = (findDisplay GZL_IDD_DLG_DIRECTOR) displayCtrl GZL_IDC_BTN_SEA;
		if ('Ship' in GZL_VEHICLE_MASK ) then { _ctrl ctrlSetTextColor [1, 1, 1, 1];}
		else { _ctrl ctrlSetTextColor [1, 1, 1, 0.5];};
		
	// set east/no east text
		_ctrl = (findDisplay GZL_IDD_DLG_DIRECTOR) displayCtrl GZL_IDC_BTN_EAST;
		if ('EAST' in GZL_SIDE_MASK ) then { _ctrl ctrlSetTextColor [1, 1, 1, 1];}
		else { _ctrl ctrlSetTextColor [1, 1, 1, 0.5];};
	
	// set west/no west text
		_ctrl = (findDisplay GZL_IDD_DLG_DIRECTOR) displayCtrl GZL_IDC_BTN_WEST;
		if ('WEST' in GZL_SIDE_MASK ) then { _ctrl ctrlSetTextColor [1, 1, 1, 1];}
		else { _ctrl ctrlSetTextColor [1, 1, 1, 0.5];};

	// set guer/no guer text
		_ctrl = (findDisplay GZL_IDD_DLG_DIRECTOR) displayCtrl GZL_IDC_BTN_GUER;
		if ('GUER' in GZL_SIDE_MASK ) then {_ctrl ctrlSetTextColor [1, 1, 1, 1];}
		else { _ctrl ctrlSetTextColor [1, 1, 1, 0.5];};		
	
	// set civ/no civ text
		_ctrl = (findDisplay GZL_IDD_DLG_DIRECTOR) displayCtrl GZL_IDC_BTN_CIV;
		if ('CIV' in GZL_SIDE_MASK ) then { _ctrl ctrlSetTextColor [1, 1, 1, 1];}
		else { _ctrl ctrlSetTextColor [1, 1, 1, 0.5];};
	
	// add effect names to list box selecting/deselecting them based upon the effects mask
		_ctrl = (findDisplay GZL_IDD_DLG_DIRECTOR) displayCtrl GZL_IDC_LST_SCENES;
		lbClear GZL_IDC_LST_SCENES;		
		{
			_index = lbAdd [GZL_IDC_LST_SCENES, _x];			
			_ctrl lbSetSelected [_index, (GZL_SCENE_MASK select _index)];
		} forEach GZL_SCENES;
		GZL_SCENE_MASK = [GZL_IDD_DLG_DIRECTOR, GZL_IDC_LST_SCENES] call GZL_fnc_SetScenes;
	// add all units and vehicles to lstVehicles
		GZL_SUBJECTS = [GZL_IDC_LST_VEHICLES, GZL_IDD_DLG_DIRECTOR, GZL_SIDE_MASK, GZL_VEHICLE_MASK, GZL_PLAYER, GZL_SUBJECT] call GZL_fnc_FillListBox;		



