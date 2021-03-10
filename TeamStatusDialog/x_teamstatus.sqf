
#include "x_setup.sqf"

if (isNil "XfTeamStatusD") then {
	__cppfln(XfTeamStatusD,\loki_lost_key\TeamStatusDialog\TeamStatusDialog.sqf);
	
};


//go = [XfTeamStatusD] execVM "\loki_lost_key\TeamStatusDialog\TeamStatusDialog.sqf";

if (vehicle player == player) then {
	[0, player, 0, ["Page", "Team"],"HideOpposition","HideVehicle","DeleteRemovedAI","AllowPlayerInvites"] spawn XfTeamStatusD;
} else {
	[player, player, 0, ["Page", "Vehicle"],["VehicleObject", vehicle player],"HideTeam","HideGroup","HideOpposition","DeleteRemovedAI","AllowPlayerInvites"] spawn XfTeamStatusD;
};

