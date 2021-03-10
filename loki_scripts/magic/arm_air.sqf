

hint "Air Vehicles Armed...";

private ["_types"];


_types = ["A10","SU34","SU34B","AV8B","AV8B2","MH6","MH6_RACS","AH1W","Mi17","Mi17_MG","UH60","UH60MG","AH6_RACS","AH6","KA50"];



	if ((typeOf (vehicle player)) in _types) then
	{



		(vehicle player) addMagazine "4Rnd_Sidewinder_AV8B";
		(vehicle player) addMagazine "4Rnd_Sidewinder_AV8B";
		(vehicle player) addMagazine "4Rnd_Sidewinder_AV8B";
		(vehicle player) addMagazine "4Rnd_Sidewinder_AV8B";
		(vehicle player) addWeapon "SidewinderLaucher";


		(vehicle player) addMagazine "8Rnd_Hellfire";
		(vehicle player) addMagazine "8Rnd_Hellfire";
		(vehicle player) addMagazine "8Rnd_Hellfire";
		(vehicle player) addMagazine "8Rnd_Hellfire";
		(vehicle player) addWeapon "HellfireLauncher";


		(vehicle player) addMagazine "38Rnd_FFAR";
		(vehicle player) addMagazine "38Rnd_FFAR";
		(vehicle player) addMagazine "38Rnd_FFAR";
		(vehicle player) addMagazine "38Rnd_FFAR";
		(vehicle player) addWeapon "FFARLauncher";


		(vehicle player) addMagazine "1350Rnd_30mmAP_A10";
		(vehicle player) addMagazine "1350Rnd_30mmAP_A10";
		(vehicle player) addMagazine "1350Rnd_30mmAP_A10";
		(vehicle player) addWeapon "GAU8";


		(vehicle player) addMagazine "6Rnd_GBU12_AV8B";
		(vehicle player) addMagazine "6Rnd_GBU12_AV8B";
		(vehicle player) addMagazine "6Rnd_GBU12_AV8B";
		(vehicle player) addWeapon "BombLauncher";		
		
		
		
	};


  		



