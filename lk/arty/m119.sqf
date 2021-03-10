if (player == player) then {

if (supply_account >= 800) then {

supply_account = supply_account - 800;
publicvariable "supply_account";


[["artillery_barrage"], player, [[arty2, [1,2,3,4,5,6,7,8,9]]]] call BIS_SOM_addSupportRequestFunc;


hint "M119 Artillery available in Communication Menu";

}

else {hint "Not enough Supplies"};

} else {hint "You are not the Commander"};