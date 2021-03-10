

reinforce = false;

publicVariable "reinforceused";

if (playerside == west) then {["reinforce", true, som_west] call BIS_SOM_requestSecOpFunc;};
if (playerside == east) then {["reinforce", true, som_east] call BIS_SOM_requestSecOpFunc;};

sleep 180;

hint "SOM Reinforcements are available again";

reinforce = true;

publicvariable "reinforce";