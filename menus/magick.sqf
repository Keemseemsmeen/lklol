lbClear 72011;


lbAdd [72011,"Body Armor"];

lbAdd [72011,"Ghost On"];
lbAdd [72011,"Ghost Off"];


lbAdd [72011,"God Mode ON"];
lbAdd [72011,"God Mode OFF"];

lbAdd [72011,"Go Loki"];
lbAdd [72011,"Go Go Loki"];
lbAdd [72011,"Heal Player"];
lbAdd [72011,"Ladder sm"];
lbAdd [72011,"Ladder big"];
//lbAdd [72011,"Hitch All"];
//lbAdd [72011,"Hook"];
lbAdd [72011,"MASH"];


lbAdd [72011,"ReArm"];
lbAdd [72011,"Repair"];

lbAdd [72011,"Uber Weapons"];



lbSetCurSel [72011,0];




Request2 = 
{

	switch (lbText [72011,lbCurSel 72011]) do
	{

		case "Ghost On": {player setCaptive true; hint "GHOST ON"};
		case "Ghost Off": {player setCaptive false; hint "GHOST OFF"};
		
		
		//case "Body Armor": {player addEventHandler ["handleDamage", { (damage (_this select 0)) + ((_this select 2) * 0.1) }]; hint "Body Armor ON"};
		case "Body Armor": {nul = [player, 3, -2] execVM "\loki_lost_key\loki_scripts\RUG_BodyArmor.sqf"; hint "Body Armor ON - takes 6 points of damage and then is depleted."};
				
		case "God Mode ON": { player allowdamage false; hint "GOD MODE ON";};
		case "God Mode OFF": {player allowdamage true; hint "GOD MODE OFF";};
		
		case "Go Loki": {call fnc_loki_go};
		case "Go Go Loki": {call fnc_loki_gogo};
		case "Heal Player": {player setdamage 0; hint 'player damage set to 0';};
		case "Ladder sm": {player addaction ['Create Small Ladder','\loki_lost_key\VFladder\createladder.sqf',[_this,0],0,false];hint 'ladder action added to your addAction menu.';};
		case "Ladder big": {player addaction ['Create Big Ladder','\loki_lost_key\VFladder\createladder.sqf',[_this,1],0,false];hint 'ladder action added to your addAction menu.';};

		case "Hitch All": {[] execVM '\loki_lost_key\loki_scripts\hitch.sqf'};
		case "Hook": {player addaction ["Hook","\loki_lost_key\loki_scripts\magic\hook.sqf",false]};
		case "MASH": {veh = createVehicle ["MASH", position player, [], 0, "NONE"];};
		

		
		case "ReArm": {[] execVM '\loki_lost_key\loki_scripts\magic\reArm.sqf'};
		case "Repair": {call fnc_loki_repair};
		case "Uber Weapons": {call fnc_loki_uber_weap};

	};

};



LN_ListBoxSel = 
{


	switch (lbText [72011,lbCurSel 72011]) do
	{

		case "Ghost On": {};
		case "Ghost Off": {};
		case "Body Armor": {};
		case "Go Loki": {};
		case "Go Go Loki": {};
		case "God Mode ON": {};
		case "God Mode OFF": {};
		case "Heal Player": {};
		case "Hitch All": {};

		case "Hook": {};
		
		case "Ladder sm": {};
		case "Ladder big": {};
		
		case "MASH": {};
		

		
		case "ReArm": {};
		case "Repair": {};

		case "Uber Weapons": {};


		
	};

	ctrlSetText [5,(format ["Request"])];
		
};

