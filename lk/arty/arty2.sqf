
artyreq = "PowerGenerator" createVehicle getpos artcons;
artyreq attachTo [artcons,[0,7,-10.8]]; 

artyac8 = artyreq addaction ["Buy M119 Fire Mission - 800 S", "\loki_lost_key\lk\arty\m119.sqf", [], 20, true, true, "", ""];
artyac9 = artyreq addaction ["Buy M270 MLRS - 1000 $", "\loki_lost_key\lk\arty\arty.sqf", [], 21, true, true, "", ""];

artyspos2 = "HeliHEmpty" createVehicle getpos artcons;
artyspos2 setPos (artcons modelToWorld [0, 20, 0]);

artygroup2 = CreateGroup West;

artym1 = createVehicle ["M119", [(getpos artyspos2) select 0,(getpos artyspos2) select 1,0], [], 0, "FORM"];
artym1crew1 = artygroup2 createUnit ["USMC_Soldier", [0,0,1], [], 0, "CAN_COLLIDE"];
artym1crew1 moveInGunner artym1;

artym2 = createVehicle ["M119", [(getpos artym1) select 0,(getpos artym1) select 1,0], [], 5, "FORM"];
artym2crew1 = artygroup2 createUnit ["USMC_Soldier", [0,0,1], [], 0, "CAN_COLLIDE"];
artym2crew1 moveInGunner artym2;

artym3 = createVehicle ["M119", [(getpos artym1) select 0,(getpos artym1) select 1,0], [], 5, "FORM"];
artym3crew1 = artygroup2 createUnit ["USMC_Soldier", [0,0,1], [], 0, "CAN_COLLIDE"];
artym3crew1 moveInGunner artym3;

artym4 = createVehicle ["M119", [(getpos artym1) select 0,(getpos artym1) select 1,0], [], 5, "FORM"];
artym4crew1 = artygroup2 createUnit ["USMC_Soldier", [0,0,1], [], 0, "CAN_COLLIDE"];
artym4crew1 moveInGunner artym4;



sleep 1;

AMG2 = creategroup sidelogic;
arty2 = AMG2 createunit ["BIS_ARTY_Logic", [0,0,1],[], 0,"none"];
arty2 synchronizeObjectsAdd [artym1];

hint "Artillery available";