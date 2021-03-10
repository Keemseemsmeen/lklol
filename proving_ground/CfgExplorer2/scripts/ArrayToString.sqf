/*****************************************************************************
  Scriptname: 
	ArrayToString.sqf
  Author: 
	HeliJunkie
	
  Description:
  Returns a string with comma seperated values
  
  Input:
	_this select 0: array
  Returns:
	String: config array string  "{...,...,...}"
*****************************************************************************/

disableSerialization;
private ["_configRoot", "_currentPath", "_ValuesArray", "_debug", "_OutString", "_TypeName", "_inArray", "_maxI", "_i"];

// ***
// *** get parameter
// ***
_inArray = _this select 0;
if ((TypeName _inArray) != "ARRAY") exitwith
{
  // "parameter error in ArrayToString.sqf"
  diag_log text "#ArrayToString: Parameter Error in ArrayToString.sqf. Expected: Array.";
};

// ***
// *** define output parameter
// ***
_OutString = "{";

// ***
// *** building the string
// ***
_maxI = (count _inArray) - 1;

for "_i" from 0 to (_maxI) do
{
  _TypeName = TypeName (_inArray select _i);
  
  switch (_TypeName) do
  {
    case "STRING":
    {
      _OutString = format["%1""%2""",_OutString,_inArray select _i];
    };

    case "SCALAR":
    {
      _OutString = format["%1%2",_OutString,_inArray select _i];    
    };

    case "ARRAY":
    {
      _OutString = format["%1%2",_OutString,[_inArray select _i] call hj_fn_ArrayToString];
    };
  };
  // add a seperator "," if it is not the last item
  If (_i != _maxI) then
  {
    _OutString = _OutString + ", ";
  };
};

_OutString = _OutString + "}";

// ***
// *** return the string
// ***
_OutString
