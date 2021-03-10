while {true} do
{
	if (!(PXS_SatelliteActive)) exitWith {};

	ctrlSetText [1001,format ["%1",call PXS_timeFunction]];

	sleep 0.1;
};