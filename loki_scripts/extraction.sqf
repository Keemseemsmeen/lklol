// original script by: NoN_Shiva  edited heavily by: loki for the lost key

deleteMarkerLocal hStart; 
hStart = createMarker ["hStart", [(position player select 0) + 1 * random 1200, (position player select 1) +1200 , 0]];
deleteMarkerLocal hEnd; 
hEnd = createMarker ["hEnd", [(position player select 0), (position player select 1) +1500 , 0]];
hEnd setMarkerBrushLocal "SOLID";
hEnd setMarkerShapeLocal "ELLIPSE";
hEnd setMarkerColorLocal "ColorGreen";
hEnd setMarkerDirLocal 0;
hEnd setMarkerSizeLocal [20,20];
click = 0;
hint "click on Map for your drop off LZ";
onMapSingleClick "hEnd setMarkerPosLocal _pos; click = 1; closeDialog 0;";

waitUntil {click == 1};
// Wait till the Functions module is ready.
waituntil {!isnil "bis_fnc_init"};

// Declare everything.
_unit = _this select 0; // who called it.
//_chopperType = "CH_47F_EP1";  // Type of transport.
_chopperType = _this select 1;

_start = getMarkerPos "hStart";  // location of start/spawn/delete location.
_end = getMarkerPos "hEnd";  // location of drop off.
_landPos = [_unit, 20, getdir _unit] call BIS_fnc_relPos;  // location of pickup, 20m in front of caller

if (isServer) then {
	// message letting them know it's coming.
	hint "Extraction Team Inbound!     can take up to 4 minutes to arrive";  
	
	// Create a little shiney ball we can use to get the direction from start to caller with
	_blinky = "Sign_sphere10cm_EP1" createVehicle _start;
	_flightPath = [_blinky, _unit] call BIS_fnc_relativeDirTo;		
	
	// Spawn the helo, facing the user, in the air at the start location.
	_ch = [[_start select 0, _start select 1, 50], _flightPath, _chopperType, side _unit] call BIS_fnc_spawnVehicle;
	
	// Name the helo globally so that waypoint orders will work.
	transporthelo = _ch select 0;
	_chGroup = _ch select 2; // group of helo so waypoints work.
	_chGroup setBehaviour "AWARE"; // Make sure they don't get distracted.
	// transporthelo setCaptive true; // uncomment this to make your ride safe.
	{_x disableAI "AUTOTARGET"} forEach units _chGroup;
	// These lines might be needed in MP. :)  Didn't test it yet. // loki -yup.. needed for calls via functions
	_ch select 0 setVehicleInit "transporthelo = this; this setVehicleVarName ""transporthelo""";
	processInitCommands;
	
	//120 sec loop to check zExtraction Team didn't die somewhere and i'll be waiting forever.
	_limit = time + 120;
	while {_limit > time} do
	{
	sleep 1;
	if (!alive transporthelo) exitWith {hint "Extraction Team Lost"};
	};

	// Delete the cute little light that let us spawn facing the right direction
	// and create landing spots for pickup and dropoff.
	deleteVehicle _blinky;
	_lzPickup = "HeliHEmpty" createvehicle _landPos;
	_lzDropOff = "HeliHEmpty" createvehicle _end;
	
	// Give the helo a waypoint to where the player is and make it land, engines on.
	wp0 = _chGroup addwaypoint [_landPos, 20];
	wp0 setwaypointtype "MOVE";
	wp0 setWaypointStatements ["","transportHelo land ""GET IN"""];
	
	// Wait till the player's group is in the helo. {isplayer _x} count playableunits
	if (isMultiplayer) then {
	waitUntil{{_x in transporthelo} count playableunits == count playableunits};
	
	} else {waitUntil {player in transporthelo}};
	
	// Once they are, off we go by setting a TRANSPORT UNLOAD waypoint.  
	// It'll auto boot the leader once there, but he'll have to tell the others to get out.
	wp1 = _chGroup addwaypoint [_end, 20];
	wp1 setwaypointtype "MOVE";
	wp1 setWaypointStatements ["","transportHelo land ""GET OUT"""];
	
	// Wait till the player's group is out of the helo.
	if (isMultiplayer) then {
	waitUntil{{_x in transporthelo} count units group _unit == 0};
	} else {waitUntil {vehicle player == player}};	
	
	// Once they are out, set a waypoint back to the start and clean up by deleting the helo and landing pads.
	wp2 = _chGroup addwaypoint [_start, 20];
	wp2 setwaypointtype "MOVE";
	wp2 setWaypointStatements ["true","{deleteVehicle _x} forEach crew transporthelo; deletevehicle transporthelo; hint 'Extraction Team is RTB and ready for orders.'"];
	deleteVehicle _lzPickup;
	deleteVehicle _lzDropOff;

};
