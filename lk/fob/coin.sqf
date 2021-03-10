
coin = _this select 0;

money_account = 8000;
supply_account = 6500;

coin setvariable ["BIS_COIN_rules",[player]];

coin setvariable ["BIS_COIN_categories",["Ammo", "ACE ammo", "Base", "Air Units", "Armored", "Light Vehicles", "Defence", "Fortifications"]]; 

coin setvariable ["BIS_COIN_onconstruct",{sleep 2; [(_this select 1)] execVM "\loki_lost_key\lk\fob\identify.sqf";}];

coin setvariable ["BIS_COIN_onrepair",{supply_account = supply_account - 100}];

coin setvariable ["BIS_COIN_areasize",[80,80]];

coin setvariable ["BIS_COIN_funds",["money_account","supply_account"]];

coin setvariable ["BIS_COIN_fundsDescription",["$ ","S "]];


coin setvariable ["BIS_COIN_items", [
	
//--- Class, Category, Cost or [fundsID,Cost], (display name)
["USBasicAmmunitionBox","Ammo",[1,10], "Basic ammunition"],
["USOrdnanceBox","Ammo",[1,15], "Explosives"],
["USLaunchersBox","Ammo",[1,30], "Launchers"],
["USSpecialWeaponsBox","Ammo",[1,50], "Special Weapons"],

["ACE_HuntIRBox","ACE ammo",[1,10], "Huntir Box"],
["ACE_BandageBoxWest","ACE ammo",[1,15], "Medic Box"],
["ACE_USLaunchersBox","ACE ammo",[1,30], "Launchers"],
["ACE_USSpecialWeaponsBox","ACE ammo",[1,50], "Special Weapons"],
["ACE_USBasicWeaponsBox","ACE ammo",[1,50], "Basic Weapons"],
["ACE_RuckBox_West","ACE ammo",[1,50], "Ruck Box"],

["USMC_WarfareBFieldhHospital","Base",[1,150], "Field Hospital"],
["USMC_WarfareBVehicleServicePoint","Base",[1,200], "Service Point"],
["USMC_WarfareBBarracks","Base",[1,800], "Barracks"],
["HeliH","Base",[1,800], "Money and Supplies"],
["USMC_WarfareBUAVterminal","Base",[1,1000], "UAV Terminal"],
["USMC_WarfareBArtilleryRadar","Base",[1,1200], "Artillery"],

["MH60S","Air Units",[0,200], "MH60S"],
["UH1Y","Air Units",[0,400], "UH1Y"],
["AH1Z","Air Units",[0,700], "AH1Z"],
["A10","Air Units",[0,1200], "A10"],
["AV8B2","Air Units",[0,1500], "AV8B2"],
["F35B","Air Units",[0,1700], "F35B"],

["LAV25","Armored",[0,350], "LAV25"],
["AAV","Armored",[0,400], "AAV"],
["M1A1","Armored",[0,500], "M1A1"],
["M1A2_TUSK_MG","Armored",[0,800], "M1A2 Tusk"],

["HMMWV_Ambulance","Light Vehicles",[0,150], "HMMWV Ambulance"],
["MTVR","Wheeled",[0,150], "MTVR"],
["MtvrReammo","Light Vehicles",[0,200], "Mtvr Ammo"],
["MtvrRefuel","Light Vehicles",[0,200], "Mtvr Fuel"],
["MtvrRepair","Light Vehicles",[0,200], "Mtvr Repair"],
["HMMWV_M2","Light Vehicles",[0,250], "HMMWV M2"],
["HMMWV_Armored","Light Vehicles",[0,300], "HMMWV Armored"],
["HMMWV_TOW","Light Vehicles",[0,350], "HMMWV TOW"],

["SearchLight","Defence",[1,15], "SearchLight"],
["M2StaticMG","Defence",[1,15], "M2 Machine Gun"],
["MK19_TriPod","Defence",[1,15], "Mk19 Minitripod"],
["M252","Defence",[1,15], "M252 81mm Mortar"],
["TOW_TriPod","Defence",[1,25], "TOW Tripod"],
["Stinger_Pod","Defence",[1,35], "AA Pod"],
["USMC_WarfareBMGNest_M240","Defence",[1,35], "MG Nest (M240)"],
["M119","Defence",[1,45], "M119"],

["Land_fortified_nest_big","Fortifications",[1,15], "Fortified Nest"],
["Fort_RazorWire","Fortifications",[1,15], "Razorwire"],
["Land_Fort_Watchtower","Fortifications",[1,15], "Watchtower"],
["Land_CamoNet_NATO","Fortifications",[1,15], "CamoNet"],
["Land_fort_bagfence_long","Fortifications",[1,15], "Sandbags"],
["Land_HBarrier_large","Fortifications",[1,15], "HBarrier (Large)"],
["Land_HBarrier5","Fortifications",[1,15], "HBarrier (Small)"],
["Land_HBarrier1","Fortifications",[1,15], "HBarrier (Cube)"]
		
]];
