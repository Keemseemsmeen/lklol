
if (money_account >= 1500) then {

_buyer = _this select 1;
barrac removeaction barac1;

money_account = money_account - 500;
publicvariable "money_account";

barspawnpos = "HeliHEmpty" createVehicle getpos barrac;
barspawnpos setPos (barrac modelToWorld [0, 15, 0]);

_grp = CreateGroup WEST;
_a1 = _grp createUnit ["USMC_Soldier_AT", [(getpos barspawnpos) select 0,(getpos barspawnpos) select 1,0], [], 20, "FORM"];
_a2 = _grp createUnit ["USMC_Soldier_AR", [(getpos _a1) select 0,(getpos _a1) select 1,0], [], 0, "FORM"];
_a3 = _grp createUnit ["USMC_Soldier_Medic", [(getpos _a1) select 0,(getpos _a1) select 1,0], [], 0, "FORM"];
_a4 = _grp createUnit ["USMC_Soldier_LAT", [(getpos _a1) select 0,(getpos _a1) select 1,0], [], 0, "FORM"];
_a5 = _grp createUnit ["USMC_SoldierM_Marksman", [(getpos _a1) select 0,(getpos _a1) select 1,0], [], 0, "FORM"];
_a1 = leader _grp;
{_x setSkill 1} foreach units _grp;

sleep 2;
[_a1, _a2, _a3, _a4, _a5] joinSilent _buyer;

nul = [barrac] execVM "\loki_lost_key\lk\upc\barmenu.sqf"
}

else {hint "Not enough Money"};