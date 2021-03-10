_booster = (findDisplay 46) displayAddEventHandler ["keyDown", "_this call (loki_logic getVariable ""booster_keyhandler"")"];
sleep 10;
(findDisplay 46) displayRemoveEventHandler ["KeyDown", _booster];