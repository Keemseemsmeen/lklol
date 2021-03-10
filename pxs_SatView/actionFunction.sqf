private ["_unit","_i"];

_unit = _this select 0;
_i = 1;

while {_i == 1} do 
{
	if (PXS_actionSwitch == 1) then 
	{
		//loki edit
		//PXS_action = _unit addAction [localize "STR_PXS_ACTION","\loki_lost_key\pxs_SatView\start_satellite.sqf"];
		localize "STR_PXS_ACTION";
		[] execVM "\loki_lost_key\pxs_SatView\start_satellite.sqf";
		//end loki edit
		
		hint localize "STR_PXS_STATUS_1";
		PXS_actionSwitch = 2;
	};
	if (PXS_actionSwitch == 0) then  
	{
		_unit removeAction PXS_action;
		call PXS_closeCamera;
		hint localize "STR_PXS_STATUS_2";
		PXS_actionSwitch = 2;
	};
	if (PXS_actionSwitch == 2) then  
	{		
	};
	sleep 0.1;
};