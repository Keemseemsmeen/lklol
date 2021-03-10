hint "mando C.A.S. console running.   you must be in a LAV-25 HQ to have the functions";

if (format ["%1", name player]=="loki") then {
LAV1 = "LAV25_HQ" createVehicle [(position player select 0) + 3, (position player select 1), 0];
};

ship1 = "baseball" createVehicle [(position player select 0) + 1000 * random 1.5376, (position player select 1) + 1000 * random 1.5376, 0];
ship1 setVehicleVarName "ship1";
ship1 allowdamage false;

Sleep 1;
mando_airsupport_type = "AV8B2";
mando_airsupport_type_rc = "AV8B";
mando_reco_cam_pos = [0,3,-2];
mando_airsupport_cmissile = ship1;



mando_airsupport_armedrec = true;
mando_airsupport_armedrec_man = false; // Set it to true for manual guidance for missiles fired from armed reco planes
mando_airsupport_armedrec_max = 720;
mando_airsupport_bomb_altmax = 1800;
mando_ingress_dir = 45;
mando_airsupport_bomb_alt = 150;
mando_airsupport_cmissile_pos = [0,-4, 1];
mando_airsupport_cmissile_alt = 300;

mando_airsupport_jump = false; // reinforcements and airborne assault will land and disembark instead of jump from chopper.

mando_support_no_cas = false;
mando_support_no_br = false;
mando_support_no_ff = false;
mando_support_no_sa = false;
mando_support_no_gs = false;
mando_support_no_ab = false;
mando_support_no_cm = false;
mando_support_no_sat = false;
mando_support_no_rc = false;
mando_support_no_ev = false;
mando_support_no_la = false;
mando_support_no_am = false;
mando_support_no_ve = false;
mando_support_no_re = false;
mando_support_no_cp = false;
mando_support_no_cb = false;


// Info text displayed in the setup / info dialog (this is an structured text)
mando_airsupport_info = "Mission info: <br />Try altitudes between 190 and 250m for carpet bombing using AV8B.<br /><br />";


// Setup dialog options 1, 2 and 3, dont set any of these variables if you dont want special options
mando_airsupport_opt1_text = "Gunships support type";
mando_airsupport_opt1_array = ["AH1Z", "A10","F35B","AV8B2","AV8B"];
mando_airsupport_opt1_action = 
{
   private["_item"];
   _item = _this select 0;
   mando_airsupport_type_ca = _item;
};


mando_airsupport_opt2_text = "Reinforcements type";
mando_airsupport_opt2_array = ["Normal", "Heavy AA","Heavy MG","Engineers"];
mando_airsupport_opt2_action = 
{
   private["_item"];
   _item = _this select 0;
   switch (_item) do
   {
      case "Normal":
      {
         mando_support_infantrytype_re = ["USMC_Soldier_TL", "USMC_Soldier_Medic", "USMC_Soldier_AT","USMC_Soldier","USMC_Soldier","USMC_Soldier","USMC_Soldier","USMC_Soldier","USMC_Soldier","USMC_Soldier"];
      };

      case "Heavy AA":
      {
         mando_support_infantrytype_re = ["USMC_Soldier_TL", "USMC_Soldier_Medic", "USMC_Soldier_AA","USMC_Soldier_AA","USMC_Soldier","USMC_Soldier","USMC_Soldier","USMC_Soldier","USMC_Soldier","USMC_Soldier"];
      };

      case "Heavy MG":
      {
         mando_support_infantrytype_re = ["USMC_Soldier_TL", "USMC_Soldier_Medic", "USMC_Soldier_MG","USMC_Soldier_MG","USMC_Soldier","USMC_Soldier","USMC_Soldier","USMC_Soldier","USMC_Soldier","USMC_Soldier"];
      };

      case "Engineers":
      {
         mando_support_infantrytype_re = ["USMC_Soldier_TL", "USMC_Soldier_Medic", "USMC_SoldierS_Engineer","USMC_SoldierS_Engineer","USMC_SoldierS_Engineer","USMC_SoldierS_Engineer","USMC_SoldierS_Engineer","USMC_SoldierS_Engineer","USMC_SoldierS_Engineer","USMC_SoldierS_Engineer"];
      };
   };
};


mando_airsupport_opt3_text = "Vehicle supply type";
mando_airsupport_opt3_array = ["HMMWV", "MTVR","MtvrRepair","M119"];
mando_airsupport_opt3_action = 
{
   private["_item"];
   _item = _this select 0;
   mando_airsupport_type_vehicle = _item;
};


mando_airsupport_opt4_text = "Ammo supply options";
mando_airsupport_opt4_array = ["Normal west", "Silenced","Heavy AT"];
mando_airsupport_opt4_action = 
{
   private["_item"];
   _item = _this select 0;
   switch (_item) do
   {
      case "Normal west":
      {
         mando_airsupport_magz = [];
         mando_airsupport_weap = [];
      };

      case "Silenced":
      {
         mando_airsupport_magz = [["30Rnd_556x45_StanagSD", 20],["15Rnd_9x19_M9SD", 20]];
         mando_airsupport_weap = [["M4A1_AIM_SD_camo", 10],["M9SD", 10]];
      };

      case "Heavy AT":
      {
         mando_airsupport_magz = [["Javelin", 3],["M136",9]];
         mando_airsupport_weap = [["Javelin", 3],["M136",3]];
      };
   }; 
};

// End of options setup dialog configuration



// Carpet bombing custom code global variable for AV8B
mando_airsupport_carpetcode = 
{
   private["_plane", "_targetpos", "_widx"];
   _plane = _this select 0;
   _targetpos = _this select 1;
   while {(([getPos _plane select 0, getPos _plane select 1, 0] distance _targetpos) > 2000) && (alive _plane)} do
   {
      Sleep 1;
   };

   if (alive _plane) then
   {
      _widx = [_plane, "BombLauncher"] call mando_weaponindex;
      for [{_i=0}, {_i<6}, {_i=_i+1}] do
      {
         _plane action ["useWeapon",_plane,driver _plane, _widx];
         Sleep 0.4;
      };
   };
};


["MMA Air Support Console", {(typeOf vehicle player == "LAV25_HQ") && (player == driver vehicle player)}]execVM"mando_missiles\mando_bombs\mando_giveme_console.sqf";