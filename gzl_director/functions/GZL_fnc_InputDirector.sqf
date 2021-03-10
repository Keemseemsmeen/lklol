private["_handled","_input","_inputType","_num","_ctrl"];
_idc = _this select 0; 
_value = (_this select 1) select 1; //_ctrl = _this select 1; 
_ctrl = (findDisplay GZL_IDD_DLG_DIRECTOR) displayCtrl _idc;
_handled = true;

switch ( _idc ) do {
	// Director Dialog (unloading)	
	case GZL_IDD_DLG_DIRECTOR :{};//if (GZL_CREATE_ACTIVE) then {[] spawn GZL_Dialog_Create;};
	// BTN CLOSE
	case GZL_IDC_BTN_CLOSE : { closeDialog GZL_IDD_DLG_DIRECTOR; };
	// BTN ACTION
	case GZL_IDC_BTN_ACTION : {
		[] spawn GZL_Director;
		ctrlEnable [GZL_IDC_BTN_ACTION, false];
		ctrlEnable [GZL_IDC_BTN_CUT, true];};
	// BTN CUT
	case GZL_IDC_BTN_CUT : {GZL_DIRECTOR_EXIT = true;};
	// BTN FADE
	case GZL_IDC_BTN_FADE : {
		GZL_SCENE_FADE = !GZL_SCENE_FADE;					
		if (GZL_SCENE_FADE)
		then {_ctrl ctrlSetTextColor [1, 1, 1, 1];}
		else {_ctrl ctrlSetTextColor [1, 1, 1, 0.5]; }; };
	// BTN MAN
	case GZL_IDC_BTN_MAN : {
		if ('Man' in GZL_VEHICLE_MASK )
		then {GZL_VEHICLE_MASK = GZL_VEHICLE_MASK - ['Man']; _ctrl ctrlSetTextColor [1, 1, 1, 0.5];}
		else {GZL_VEHICLE_MASK = GZL_VEHICLE_MASK + ['Man']; _ctrl ctrlSetTextColor [1, 1, 1, 1]; };
		GZL_SUBJECTS = [GZL_IDC_LST_VEHICLES, GZL_IDD_DLG_DIRECTOR, GZL_SIDE_MASK, GZL_VEHICLE_MASK, GZL_PLAYER, GZL_SUBJECT] call GZL_fnc_FillListBox;};  				
	// BTN AIR
	case GZL_IDC_BTN_AIR : {
		if ('Air' in GZL_VEHICLE_MASK )
		then {GZL_VEHICLE_MASK = GZL_VEHICLE_MASK - ['Air']; _ctrl ctrlSetTextColor [1, 1, 1, 0.5];}
		else {GZL_VEHICLE_MASK = GZL_VEHICLE_MASK + ['Air']; _ctrl ctrlSetTextColor [1, 1, 1, 1]; };
		GZL_SUBJECTS = [GZL_IDC_LST_VEHICLES, GZL_IDD_DLG_DIRECTOR, GZL_SIDE_MASK, GZL_VEHICLE_MASK, GZL_PLAYER, GZL_SUBJECT] call GZL_fnc_FillListBox;};  
	// BTN LAND
	case GZL_IDC_BTN_LAND : {
		if ('LandVehicle' in GZL_VEHICLE_MASK )
		then {GZL_VEHICLE_MASK = GZL_VEHICLE_MASK - ['LandVehicle']; _ctrl ctrlSetTextColor [1, 1, 1, 0.5];}
		else {GZL_VEHICLE_MASK = GZL_VEHICLE_MASK + ['LandVehicle']; _ctrl ctrlSetTextColor [1, 1, 1, 1];};
		GZL_SUBJECTS = [GZL_IDC_LST_VEHICLES, GZL_IDD_DLG_DIRECTOR, GZL_SIDE_MASK, GZL_VEHICLE_MASK, GZL_PLAYER, GZL_SUBJECT] call GZL_fnc_FillListBox;};
	// BTN SEA
	case GZL_IDC_BTN_SEA : {
		if ('Ship' in GZL_VEHICLE_MASK )
		then {GZL_VEHICLE_MASK = GZL_VEHICLE_MASK - ['Ship']; _ctrl ctrlSetTextColor [1, 1, 1, 0.5];}
		else {GZL_VEHICLE_MASK = GZL_VEHICLE_MASK + ['Ship']; _ctrl ctrlSetTextColor [1, 1, 1, 1]; };
		GZL_SUBJECTS = [GZL_IDC_LST_VEHICLES, GZL_IDD_DLG_DIRECTOR, GZL_SIDE_MASK, GZL_VEHICLE_MASK, GZL_PLAYER, GZL_SUBJECT] call GZL_fnc_FillListBox;};					
	// BTN EAST	
	case GZL_IDC_BTN_EAST : {
		if ('EAST' in GZL_SIDE_MASK )
		then { GZL_SIDE_MASK = GZL_SIDE_MASK - ['EAST']; _ctrl ctrlSetTextColor [1, 1, 1, 0.5];}
		else { GZL_SIDE_MASK = GZL_SIDE_MASK + ['EAST']; _ctrl ctrlSetTextColor [1, 1, 1, 1]; };
		GZL_SUBJECTS = [GZL_IDC_LST_VEHICLES, GZL_IDD_DLG_DIRECTOR, GZL_SIDE_MASK, GZL_VEHICLE_MASK, GZL_PLAYER, GZL_SUBJECT] call GZL_fnc_FillListBox;};
	// BTN WEST	
	case GZL_IDC_BTN_WEST : {
		if ('WEST' in GZL_SIDE_MASK )
		then { GZL_SIDE_MASK = GZL_SIDE_MASK - ['WEST']; _ctrl ctrlSetTextColor [1, 1, 1, 0.5];}
		else { GZL_SIDE_MASK = GZL_SIDE_MASK + ['WEST']; _ctrl ctrlSetTextColor [1, 1, 1, 1]; };
		GZL_SUBJECTS = [GZL_IDC_LST_VEHICLES, GZL_IDD_DLG_DIRECTOR, GZL_SIDE_MASK, GZL_VEHICLE_MASK, GZL_PLAYER, GZL_SUBJECT] call GZL_fnc_FillListBox;};
	// BTN GUER	
	case GZL_IDC_BTN_GUER : {
		if ('GUER' in GZL_SIDE_MASK )
		then { GZL_SIDE_MASK = GZL_SIDE_MASK - ['GUER']; _ctrl ctrlSetTextColor [1, 1, 1, 0.5];}
		else { GZL_SIDE_MASK = GZL_SIDE_MASK + ['GUER']; _ctrl ctrlSetTextColor [1, 1, 1, 1]; };
		GZL_SUBJECTS = [GZL_IDC_LST_VEHICLES, GZL_IDD_DLG_DIRECTOR, GZL_SIDE_MASK, GZL_VEHICLE_MASK, GZL_PLAYER, GZL_SUBJECT] call GZL_fnc_FillListBox;};
	// BTN CIV	
	case GZL_IDC_BTN_CIV : {
		if ('CIV' in GZL_SIDE_MASK )
		then { GZL_SIDE_MASK = GZL_SIDE_MASK - ['CIV']; _ctrl ctrlSetTextColor [1, 1, 1, 0.5];}
		else { GZL_SIDE_MASK = GZL_SIDE_MASK + ['CIV']; _ctrl ctrlSetTextColor [1, 1, 1, 1]; };
		GZL_SUBJECTS = [GZL_IDC_LST_VEHICLES, GZL_IDD_DLG_DIRECTOR, GZL_SIDE_MASK, GZL_VEHICLE_MASK, GZL_PLAYER, GZL_SUBJECT] call GZL_fnc_FillListBox;};					
	// SLIDER SUBJECT BIAS
	case GZL_IDC_SLD_SUBJECT_BIAS : { GZL_SUBJECT_BIAS = _value; };
	// SLIDER ACCTIME
	case GZL_IDC_SLD_ACCTIME : {					
		setAccTime _value;
		if (acctime == 0 ) then { GZL_ACCTIME = 1.0; } else { GZL_ACCTIME = acctime; };						
		_num = [_value, 2] call GZL_fnc_TrimDecimal;
		ctrlSetText [GZL_IDC_TXT_ACCTIME, str _num]; };
	//SLIDER PRELOAD
	case GZL_IDC_SLD_PRELOAD : { GZL_CAM_PRELOAD = round(_value);};			
	// TXT ACCTIME
	case GZL_IDC_TXT_ACCTIME : {
		_num = parseNumber ctrlText GZL_IDC_TXT_ACCTIME;
		setAcctime _num;					
		sliderSetPosition [GZL_IDC_SLD_ACCTIME, acctime]; };
	// TXT SCENE LENGTH
	case GZL_IDC_TXT_SCENE_LENGTH : {
		GZL_SCENE_LENGTH = parseNumber ctrlText GZL_IDC_TXT_SCENE_LENGTH; };
	// LISTBOX SCENES
	case GZL_IDC_LST_SCENES : { 
		if ( (_this select 2) == "focus" ) then {
			_getScenes = [GZL_IDD_DLG_DIRECTOR, GZL_IDC_LST_SCENES] call GZL_fnc_SetScenes;
			if ((count _getScenes) > 0) then {GZL_SCENE_MASK = _getScenes;};	}
		else {if (!GZL_SCENE_SKIP) then {GZL_SCENE_SKIP = true;};};		
		};
	// LISTBOX VEHICLES	
	case GZL_IDC_LST_VEHICLES : { 
		GZL_SUBJECT = [GZL_SUBJECTS select _value, _value];
		GZL_SUBJECT_HOLD = false;
		if (_value !=0 ) then {GZL_SUBJECT_HOLD = true};
		GZL_SCENE_SKIP = true;};
	
	//case GZL_IDC_CREATE_BTN_MOVIES : { GZL_IDC_};
}; //end switch					
_handled;