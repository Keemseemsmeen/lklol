publicVariable "YNH_ViewDistance";
publicVariable "fncYNH_intro_picker";
publicVariable "fncYNH_HeloInsertion";
publicVariable "fncYNH_ANN";
publicVariable "fncYNH_music_picker";
publicVariable "fncYNH_SetCamTi";

publicVariable "fncSetCamUseTiKilla";

// AAN News Intro Function
fncYNH_ANN = {

if (true) then
{
  
	/********************* UNIT CREATION ********************/
	
	BIS_CAM_Target1 = "ZSU_TK_EP1" createVehicle (getMarkerPos "mkrAAN_Target1");
	BIS_CAM_Target1 allowdamage false;
	BIS_CAM_Target1 setCaptive true;
	
	BIS_CAM_Target2 = "ZSU_TK_EP1" createVehicle (getMarkerPos "mkrAAN_Target2");
	BIS_CAM_Target2 allowdamage false;
	BIS_CAM_Target2 setCaptive true;

	BIS_UAVTarget1 = "ZSU_TK_EP1" createVehicle (getMarkerPos "mkrBIS_UAVTarget1");
	
	
	BIS_UAVTarget2 = "MLRS_DES_EP1" createVehicle (getMarkerPos "mkrBIS_UAVTarget2");
	
	
	BIS_UAVTarget3 = "GRAD_TK_EP1" createVehicle (getMarkerPos "mkrBIS_UAVTarget3");	

};
};

// Helo Insertion Intro Function
fncYNH_HeloInsertion = {

if (true) then
{
  
	/********************* UNIT CREATION ********************/
	_howMany = playersNumber west;

	if ( _howMany >= 6 ) then {
	
	intro_helo = createVehicle ["UH60M_EP1",(getMarkerPos "helo_insert_start"), [], 0, "FLY"]; 	
	} else {
	intro_helo = createVehicle ["MH6J_EP1",(getMarkerPos "helo_insert_start"), [], 0, "FLY"]; 	
	};
	
	GroupIntroHelo = CreateGroup WEST;	
	intro_helo_pilot = GroupIntroHelo createUnit ["US_Soldier_Pilot_EP1", [(getpos player) select 0,(getpos player) select 1,0], [], 5, "FORM"];
	intro_helo_pilot moveindriver intro_helo;
	intro_helo_pilot2 = GroupIntroHelo createUnit ["US_Soldier_Pilot_EP1", [(getpos player) select 0,(getpos player) select 1,0], [], 5, "FORM"];
	intro_helo_pilot2 moveincargo intro_helo;
	
	/********************* GET IN DA HELO ********************/
	player assignasCargo intro_helo;
	player moveinCargo intro_helo;
	

	/********************* LETS GO ********************/
	wp1 = GroupIntroHelo addwaypoint [getMarkerPos "helo_insert_move1", 0];
	wp1 setwaypointtype "MOVE";


	/********************* GET OUT ********************/
	wp2 = GroupIntroHelo addwaypoint [getMarkerPos "helo_insert_move2", 0];
	wp2 setwaypointtype "GETOUT";

};
};




// Random Intro Picker Function
fncYNH_intro_picker = {

cutRsc ["LOKI_MissionName","PLAIN",2];

fncAddIntro = {
  switch _this do
	{
    case 0: 
	{
	Sleep 3;
	1 cutRsc ["Loki_FU","PLAIN",2]; 
	sleep 10;
	[localize "STR_INTRO_x0", localize "STR_INTRO_x0a", str(date select 2) + "." + str(date select 1) + "." + str(date select 0)] spawn BIS_fnc_infoText;
    };
	
    case 1: 
	{
	
	sleep 3;
	1 cutRsc ["sanford","PLAIN",2];
	sleep 10;
	[localize "STR_INTRO_x1", localize "STR_INTRO_x1a", str(date select 2) + "." + str(date select 1) + "." + str(date select 0)] spawn BIS_fnc_infoText;
    };
	
    case 2: 
	{
	Sleep 3;	
	1 cutRsc ["redfist","PLAIN",2]; 
	sleep 10;
	[localize "STR_INTRO_x2", localize "STR_INTRO_x2a", str(date select 2) + "." + str(date select 1) + "." + str(date select 0)] spawn BIS_fnc_infoText;
    };
	
	case 3: 
	{
	Sleep 3;	
	1 cutRsc ["resistance","PLAIN",2];
	sleep 10;
	[localize "STR_INTRO_x3", localize "STR_INTRO_x3a", str(date select 2) + "." + str(date select 1) + "." + str(date select 0)] spawn BIS_fnc_infoText;
    };
	};
};
IntroCount = 4;
fncPickIntro = {
  if isserver then {
    if (count Intro != 0) then {
      addIntro = Intro select (floor random count Intro);
      Intro = Intro - [addIntro];
      publicvariable "addIntro";
      if !isdedicated then { addIntro call fncAddIntro };
    };
  };
};  
  
if isserver then {
  Intro = [];
  for "_i" from 0 to (IntroCount - 1) do {
    Intro set [_i,_i];
  };
} else {
  [] spawn {
    waituntil {!isnil "addIntro"};
    addIntro call fncAddIntro;
    "addIntro" addpublicvariableeventhandler {(_this select 1) call fncAddIntro};
  };
};  
call fncPickIntro; // add random Intro for fun	  
};


// Random Intro Music Picker Function
fncYNH_music_picker = {

fncYNHAddMusic = {
  switch _this do
	{
    case 0: 
	{
	playSound "Mission_Intro";
    };
    case 1: 
	{
	playSound "Mission_Intro1";
    };
    case 2: 
	{
	playSound "Mission_Intro2";
	};
    case 3: 
	{
	playSound "Mission_Intro3";
    };
	};
};

MusicCount = 4;
fncYNHPickMusic = {
  if isserver then {
    if (count Music != 0) then {
      addMusic = Music select (floor random count Music);
      Music = Music - [addMusic];
      publicvariable "addMusic";
      if !isdedicated then { addMusic call fncYNHAddMusic };
    };
  };
};  
  
if isserver then {
  Music = [];
  for "_i" from 0 to (MusicCount - 1) do {
    Music set [_i,_i];
  };
} else {
  [] spawn {
    waituntil {!isnil "addMusic"};
    addMusic call fncYNHAddMusic;
    "addMusic" addpublicvariableeventhandler {(_this select 1) call fncYNHAddMusic};
  };
};  
call fncYNHPickMusic; // add random Music for fun	  
};

// SetCamTi (Thermal Imaging) Random Generator
fncYNH_SetCamTi = {

fncYNHAddSetCamTi = {
  switch _this do
	{
    case 0: {	true SetCamUseTi 0;  };
    case 1: {	true SetCamUseTi 1;  };
    case 2: {	true SetCamUseTi 2;  };
    case 3: {	true SetCamUseTi 3;  };
    case 4: {	true SetCamUseTi 4;  };
    case 5: {	true SetCamUseTi 5;  };
    case 6: {	true SetCamUseTi 6;  };
    };	
};



SetCamTiCount = 7;
fncYNHPickSetCamTi = {
  if isserver then {
    if (count SetCamTi != 0) then {
      addSetCamTi = SetCamTi select (floor random count SetCamTi);
      SetCamTi = SetCamTi - [addSetCamTi];
      publicvariable "addSetCamTi";
      if !isdedicated then { addSetCamTi call fncYNHAddSetCamTi };
    };
  };
};  
  
if isserver then {
  SetCamTi = [];
  for "_i" from 0 to (SetCamTiCount - 1) do {
    SetCamTi set [_i,_i];
  };
} else {
  [] spawn {
    waituntil {!isnil "addSetCamTi"};
    addSetCamTi call fncYNHAddSetCamTi;
    "addSetCamTi" addpublicvariableeventhandler {(_this select 1) call fncYNHAddSetCamTi};
  };
};  
call fncYNHPickSetCamTi; // add random Flir Mode to Cam for fun	
};

// SetCamTi (Thermal Imaging) Killer.. me thinks gotta be a betta way
fncSetCamUseTiKilla = {

if (true) then
{

false SetCamUseTi 0;
false SetCamUseTi 1;
false SetCamUseTi 2;
false SetCamUseTi 3;
false SetCamUseTi 4;
false SetCamUseTi 5;
false SetCamUseTi 6;

};
};