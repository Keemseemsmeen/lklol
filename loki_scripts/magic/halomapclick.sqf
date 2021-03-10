// Call from:
//     action = "[] execVM '\loki_lost_key\loki_scripts\magic\halomapclick.sqf'";

HALOMark = createMarker ["HALOMark", getPos player];
HALOMark setMarkerPos (getPos player);
HALOMark setMarkerBrush "SOLID";
HALOMark setMarkerShape "ELLIPSE";
HALOMark setMarkerColor "ColorGreen";
HALOMark setMarkerSize [50,50];

//run advanced hints
[] call bis_fnc_hints;

//create an empty thread, to avoid 'BIS_AdvHints_Spawn' being nil at the beginning
if (isNil "BIS_AdvHints_Spawn") then {
	BIS_AdvHints_Spawn = [] spawn {
		waitUntil {false};
	};
};

hint "Set your height in the box below... then click on the MAP for HALO start";
onMapSingleClick "HALO = [_pos] spawn Request_HALO; true";

HALO_Height = "";
ctrlSetText [72153,(format ["%1",HALO_Height])];

Request_HALO = 
{

    _pos = _this select 0;
    _height = parseNumber (ctrlText 72153); 
    "HALOMark" setMarkerPos _pos;
    player setPos _pos;
	execFSM "\loki_lost_key\loki_scripts\halo.fsm";
    [player, _height + random 10] exec "ca\air2\halo\data\Scripts\HALO_init.sqs";
    closeDialog 0;
    onMapSingleClick "";
    sleep 5;
    "HALOMark" setMarkerPos [0,0];
	deleteMarker "HALOMark";

};