_unit   = _this select 0;
_cargo  = _this select 1;
_height = _this select 2;

_state  = _unit getVariable "mando_hitch";
if (isNil "_state") then 
{
   _unit setVariable ["mando_hitch", 1];
};

while {(_unit getVariable "mando_hitch") == 1} do
{

   _vup = vectorUp _unit;
   _vdir = vectorDir _unit;

   _cargo setPos (_unit modelToWorld [0,0,-_height]);

   _cargo setVectorDir _vdir;
   _cargo setVectorUp  _vup;

   if (damage _cargo > 0.2) then
   {
      _unit setVariable ["mando_hitch", 0];
   };

   Sleep 0.001;
};
_cargo setVelocity [0,0,0];