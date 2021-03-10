
_building = _this select 0;

if (_building iskindOf "USMC_WarfareBUAVterminal" && uavcons) then {hint "UAV Constructed - you can now use the Predator UAV"; uavcons = false; uavter = _building; uavlh = true; UAVmod synchronizeObjectsAdd [uavter]; [uavter] exec "\loki_lost_key\lk\uav\uav_menu.sqf";};

if (_building iskindOf "USMC_WarfareBBarracks" && barcons) then {hint "Barracks Constructed - you can now buy units from barracks"; barcons = false; barrac = _building; barbuy = true; [barrac] exec "\loki_lost_key\lk\upc\barmenu.sqf";};

if (_building iskindOf "USMC_WarfareBArtilleryRadar" && arty) then {hint "Artillery Radar Constructed - you can request artillery barrage now"; arty = false; artcons = _building; builtarty = true; nul = [artcons] execVM "\loki_lost_key\lk\arty\arty2.sqf";};

if (_building iskindOf "HeliH" && sm) then {hint "Supplies Helipad Constructed - you can recive supplies and money now"; sm = false; builtsm = true; smh = _building; nul = [smh] execVM "\loki_lost_key\lk\upc\sm.sqf";};
