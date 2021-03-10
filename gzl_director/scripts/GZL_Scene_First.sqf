//============================================================================================================================================
//
//============================================================================================================================================
private["_cam","_vehicle"];
private["_vars","_view","_type"];
//============================================================================================================================================
// Assign parameters
//============================================================================================================================================
_cam = _this select 0;
_vehicle = _this select 1;
//============================================================================================================================================
// Init variables
//============================================================================================================================================
GZL_CAM_SWITCH = false;
_missileActive = false;
_vars = ["Air","LandVehicle","Man"];
_alternate = round(random 1);
_type = "";
_view = "";
_eventA = _vehicle addEventHandler ["IncomingMissile", { ["INCOMING", _this] spawn GZL_SCENE_MISSILE; }];
_eventB = _vehicle addEventHandler ["Fired", { ["FIRED", _this] spawn GZL_SCENE_MISSILE; }];

{if (_vehicle isKindOf _x) exitWith {_type = _x;};} foreach _vars;
switch (_type) do
{
	case "Air" :{ if ( _alternate == 0 ) then {_view = "INTERNAL";} else {_view = "GUNNER";}; };
	case "LandVehicle" : { if ( _alternate == 0 ) then {_view = "INTERNAL";} else {_view = "GUNNER";}; };
	case "Man" : {_view = "INTERNAL"; };
	default { _view = "INTERNAL"; };
};
if (!alive _vehicle) then {_view = "EXTERNAL";}; //internal on destroyed vehicles looks bad.
_vehicle switchCamera _view;
_cam cameraEffect ["TERMINATE", "BACK"]; 
camDestroy _cam;
cameraEffectEnableHUD false;
//============================================================================================================================================
// Main Loop
//============================================================================================================================================
while { !GZL_SCENE_STOP } do {

	if ( GZL_MISSILE_ACTIVE ) then {
		GZL_SCENE_EXTEND = true;
		waituntil {!GZL_MISSILE_ACTIVE};
		GZL_SCENE_EXTEND = false;};	
	
//switch first person camera between internal and external views	
	if ( ( GZL_CAM_SWITCH ) && ( !isNull _vehicle )) then {			
		GZL_CAM_SWITCH = false;
		if ( cameraView == "INTERNAL" )
		then { _vehicle switchCamera "EXTERNAL";}
		else { _vehicle switchCamera "INTERNAL";};
	};

	sleep GZL_SLEEP * GZL_ACCTIME;
	GZL_SCENE_ACTIVE = true;
};
//============================================================================================================================================
// Cleanup
//============================================================================================================================================
_vehicle removeEventHandler ["IncomingMissile",_eventA];
_vehicle removeEventHandler ["Fired", _eventB];
//============================================================================================================================================
//============================================================================================================================================
