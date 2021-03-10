if (player == player) then {

if (money_account >= 1000) then {

money_account = money_account - 1000;
publicvariable "money_account";


artyreq removeaction artyac9;

artyspos = "HeliHEmpty" createVehicle getpos artcons;
artyspos setPos (artcons modelToWorld [-10,-20,0]);

artygroup = CreateGroup West;

artyveh1 = createVehicle ["MLRS", [(getpos artyspos) select 0,(getpos artyspos) select 1,0], [], 0, "FORM"];
artycrew1 = artygroup createUnit ["USMC_Soldier_Crew", [0,0,1], [], 0, "CAN_COLLIDE"];
artycrew1 moveInDriver artyveh1;
artycrew2 = artygroup createUnit ["USMC_Soldier_Crew", [0,0,1], [], 0, "CAN_COLLIDE"];
artycrew2 moveInGunner artyveh1;

artyveh2 = createVehicle ["MLRS", [(getpos artyveh1) select 0,(getpos artyveh1) select 1,0], [], 10, "FORM"];
artycrew3 = artygroup createUnit ["USMC_Soldier_Crew", [0,0,1], [], 0, "CAN_COLLIDE"];
artycrew3 moveInDriver artyveh2;
artycrew4 = artygroup createUnit ["USMC_Soldier_Crew", [0,0,1], [], 0, "CAN_COLLIDE"];
artycrew4 moveInGunner artyveh2;

artyveh4 = createVehicle ["MLRS", [(getpos artyveh1) select 0,(getpos artyveh1) select 1,0], [], 10, "FORM"];
artycrew5 = artygroup createUnit ["USMC_Soldier_Crew", [0,0,1], [], 0, "CAN_COLLIDE"];
artycrew5 moveInDriver artyveh4;
artycrew6 = artygroup createUnit ["USMC_Soldier_Crew", [0,0,1], [], 0, "CAN_COLLIDE"];
artycrew6 moveInGunner artyveh4;

artygroup setFormation "DIAMOND";
sleep 1;

AMG = creategroup sidelogic;
arty = AMG createunit ["BIS_ARTY_Logic", [0,0,1],[], 0,"none"];
arty synchronizeObjectsAdd [artyveh1];

hint "Now you can command your artillery";

artyac9 = artyreq addaction ["Buy MLRS Fire Mission - 800 S", "\loki_lost_key\lk\arty\mlrs.sqf", [], 1, true, true, "", ""];

player hcsetgroup [artygroup,""];


}

else {hint "Not enough Money"};

} else {hint "You are not the Commander"};