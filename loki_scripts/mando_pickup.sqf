

_unit    = _this select 0;
_soldier = _this select 1;
_action  = _this select 2;






if (_soldier != driver _unit) exitWith
{
   cutText["You must be the pilot", "PLAIN DOWN"];
};



_units = [getPos _unit select 0, getPos _unit select 1] nearObjects ["All", 10];
_units = _units + ([getPos _unit select 0, getPos _unit select 1] nearObjects ["ship", 10]);
_units = _units + ([getPos _unit select 0, getPos _unit select 1] nearObjects ["Plane", 10]);

if ((count _units) > 0) then
{
   _cargo = _units select 0;
   if (_cargo distance _unit < 8) then 
   {
      _unit setVariable ["mando_hitch", 1];
      [_unit, _cargo, 7]execVm "\loki_lost_key\loki_scripts\mando_hitch.sqf";
      _unit removeAction _action;
      _unit addAction ["Drop cargo", "\loki_lost_key\loki_scripts\mando_drop.sqf"];   
   };




};
  


