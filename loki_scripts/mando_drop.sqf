_unit    = _this select 0;
_soldier = _this select 1;
_action  = _this select 2;

if (_soldier != driver _unit) exitWith
{
   cutText["You must be the pilot", "PLAIN DOWN"];
};

_unit setVariable ["mando_hitch", 0];
_unit removeAction _action;
_unit addAction ["Pick up cargo", "\loki_lost_key\loki_scripts\mando_pickup.sqf"];
