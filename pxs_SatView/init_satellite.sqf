private["_unit","_activeStatus"];

//init: [unitName, activeStatus] execVM "init_satellite.sqf";
_unit = _this select 0;
_activeStatus = _this select 1;

//start functions
PXS_timeFunction = compile preprocessFileLineNumbers "\loki_lost_key\pxs_SatView\time_function.sqf";
PXS_timeView = compile preprocessFileLineNumbers "\loki_lost_key\pxs_SatView\time_view.sqf";
PXS_coordinatesView = compile preprocessFileLineNumbers "\loki_lost_key\pxs_SatView\coordinates_view.sqf";
PXS_adjustCamera = compile preprocessFileLineNumbers "\loki_lost_key\pxs_SatView\adjustCamera.sqf";
PXS_updateCamera = compile preprocessFileLineNumbers "\loki_lost_key\pxs_SatView\updateCamera.sqf";
PXS_closeCamera = compile preprocessFileLineNumbers "\loki_lost_key\pxs_SatView\closeCamera.sqf";
PXS_viewSatellite = compile preprocessFileLineNumbers "\loki_lost_key\pxs_SatView\view_satellite.sqf";
PXS_keyEventFunction = compile preprocessFileLineNumbers "\loki_lost_key\pxs_SatView\key_function.sqf";
PXS_mouseZChanged = compile preprocessFileLineNumbers "\loki_lost_key\pxs_SatView\mouseZChanged.sqf";
PXS_keyMain = compile preprocessFileLineNumbers "\loki_lost_key\pxs_SatView\key_main.sqf";
PXS_actionFunction = compile preprocessFileLineNumbers "\loki_lost_key\pxs_SatView\actionFunction.sqf";

//create action
PXS_actionSwitch = _activeStatus;
[_unit] call PXS_actionFunction;