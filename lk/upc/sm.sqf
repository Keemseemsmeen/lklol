
smspawnpos = "HeliHEmpty" createVehicle getpos smh;
smspawnpos setPos (smh modelToWorld [0, 3000, 0]);

sleep 2;

smgroup = CreateGroup West;
smchoper = createVehicle ["MH60S", [(getpos smspawnpos) select 0,(getpos smspawnpos) select 1, 0], [], 0, "FLY"];
smp1 = smgroup createUnit ["USMC_Soldier_Pilot", [0,0,1], [], 0, "CAN_COLLIDE"];
smp1 moveInDriver smchoper;
smp2 = smgroup createUnit ["USMC_Soldier_Pilot", [0,0,1], [], 0, "CAN_COLLIDE"];
smp2 moveInGunner smchoper;
smchoper FlyInHeight 200;

smtrigger = createTrigger ["EmptyDetector", getPos smh]; 
smtrigger setTriggerStatements ["!(canMove smchoper)", "player SideChat ""SMH has been destroyed""; [] exec ""\loki_lost_key\lk\upc\dsm.sqf""" , ""];
smtrigger setTriggerTimeout [10, 10, 10, true ];

smchoper setPos (smspawnpos modelToWorld [0, 0, 400]);

wp1 = smgroup addwaypoint [position smh, 100];
wp1 setwaypointtype "MOVE";

wp2 = smgroup addwaypoint [position smh, 0];
wp2 setwaypointtype "GETOUT";
wp2 setWaypointBehaviour "CARELESS";
wp2 setWaypointSpeed "LIMITED" ;
wp2 setWaypointTimeout [20, 25, 30];
wp2 setWaypointStatements ["true", "smp1 sidechat ""Supplies and Money have been delivered, RTB""; money_account = money_account + 1000; supply_account = supply_account + 1000;"];

wp3 = smgroup addwaypoint [position smh, 0];
wp3 setwaypointtype "GETIN";
wp3 setWaypointStatements ["true", ""];

wp4 = smgroup addwaypoint [position smspawnpos, 0];
wp4 setwaypointtype "MOVE";
wp4 setWaypointStatements ["true", "nul = [] execvm ""\loki_lost_key\lk\upc\dsm.sqf"""];
smchoper FlyInHeight 200;