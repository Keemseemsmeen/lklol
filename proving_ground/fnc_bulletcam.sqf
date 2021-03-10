#include "defs.hpp"
if loki_get(bulletcam) then {
	loki_set(bulletcam,false);
	hint "Bulletcam disabled";
}else{
	hint "Bulletcam enabled";
	loki_set(bulletcam,true);
	[] spawn {
		while {loki_get(bulletcam)} do {
			_veh = vehicle player;
			_firedEH = _veh addEventHandler["fired","_this spawn (loki_logic getVariable ""FNC_bullettrack"")"];
			waitUntil {sleep 1;(!(loki_get(bulletcam))or(_veh != (vehicle player)))};
			_veh removeEventHandler ["fired", _firedEH];
		};
	};
};


