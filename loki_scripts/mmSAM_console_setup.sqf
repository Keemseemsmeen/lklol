
hint "The gunner in any LAV25 or BTR90_HQ will find menu actions to activate the S.A.M. systems";

// cuz i'm to lazy to keep spawning shit to test
if (format ["%1", name player]=="loki" && playerside == west) then {
LAV1 = "LAV25" createVehicle [(position player select 0) + 3, (position player select 1), 0];
};
if (format ["%1", name player]=="loki" && playerside == east) then {
LAV1 = "BTR90_HQ" createVehicle [(position player select 0) + 3, (position player select 1), 0];
};

[]spawn
{
   while {!alive player} do
   {
      Sleep 1;
   };
   // LAV25 units will be simulated HAWK launchers for players as gunners (missile idx 0)
   _mcctypeaascript = "mando_missiles\mcc\mcc_types\mando_missilecontrolon_hawk.sqs";
   [["LAV25"], 8, 8, ["Air"], "Hawk Console", _mcctypeaascript, [0,0,0,2], [0,1,0.25], 1, -1, 0, [], 3, 100]execVM"mando_missiles\mcc\mando_mccallow_by_type.sqf";

   // BTR90_HQ units will be simulated TORM1 launchers for players as gunners (missile idx 0)
   _mcctypeaascript = "mando_missiles\mcc\mcc_types\mando_missilecontrolon_torm1.sqs";
[["BTR90_HQ"], 8, 8, ["Air"], "TorM1 Console", _mcctypeaascript, [0,0,0,2], [0,1,0.25], 1, -1, 0, [], 3, 85]execVM"mando_missiles\mcc\mando_mccallow_by_type.sqf";

};