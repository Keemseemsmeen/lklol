waitUntil {player == player};

3 cutRsc ["lostkey","PLAIN",5];

playSound "Mission_Intro_short"; 

[localize "STR_INTRO_SHORT", str(date select 2) + "." + str(date select 1) + "." + str(date select 0), localize "STR_EP1_description.ext0_13"] spawn BIS_fnc_infoText;

