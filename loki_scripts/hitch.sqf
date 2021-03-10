private ["_types"];

hint "Hitch All option added to Helo's...";

_types = ["MH6","MH6_RACS","AH1W","Mi17","Mi17_MG","UH60","UH60MG","AH6_RACS","AH6","KA50"];


	if ((typeOf (vehicle player)) in _types) then
	{

	   (vehicle player) addAction ["Hitch Vehicle", "\loki_lost_key\loki_scripts\mando_pickup.sqf"];


	};







