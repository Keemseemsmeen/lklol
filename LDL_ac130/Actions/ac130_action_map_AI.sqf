/*	ac130_action_map_AI.sqf for AC130-Script
*	@author: LurchiDerLurch
*	@param: nothing
*	@return: nothing
*	@description: 
*/

//local variables
private["_pos", "_mapclicks"];

_mapclicks = player getVariable "LDL_Mapclicks";

if (isNil "_mapclicks") then
{
	player setVariable ["LDL_Mapclicks", 0, true];
	_mapclicks = 0;
};

if(!LDL_ac130_active && _mapclicks < LDL_options select 22) then
{
	hint "Click on the map for start location.";

	onMapSingleClick 
	{
		[_pos]spawn
		{
			private["_pos"];
			_pos = _this select 0;
			
			player setVariable ["LDL_Mapclicks", ((player getVariable "LDL_Mapclicks") + 1), true];
			
			hint format ["%1 AC-130 left.", (LDL_options select 22) - (player getVariable "LDL_Mapclicks")];
			closeDialog 0;	
			sleep 1;
			
			//[POSITION/OBJECT, RADIUS, HEIGHT, TIME, DELAY]
			[_pos,LDL_options select 0,LDL_options select 1,LDL_options select 14, LDL_options select 20]call LDL_ac130_AI_setup;
		};
		onMapSingleClick {};
	};
}
else
{
	hint "AC-130 is unavailable!";	
};