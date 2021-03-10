// SPON Core v0.5.3 (Addon version)
//
// Copyright (C) 2007-8 Bil Bas (bil {dot} bagpuss [at] gmail {dot} com / Spooner)
// License: GNU Lesser General Public License, version 3 <http://www.gnu.org/licenses/>

#ifndef SPON_ADDON
#define SPON_ADDON
#endif

// ---------------------------------------------------------------------------
SPON_registerVersion =
{
	SPON_GET_PARAMS_3(_tag,_component,_version);
	
	private ["_versionVariable", "_currentVersion", "_valid"];
	
	_versionVariable = _tag + "_" + _component + "_version";
	_currentVersion = call compile format
		['if (isNil "%1") then { nil } else { %1 };', _versionVariable];
	
	if (isNil "_currentVersion") then
	{
		call compile format ["%1 = %2", _versionVariable, _version];
		_valid = true;
	}
	else
	{
		if (([_version, _currentVersion] call SPON_compareVersions) > 0) then
		{
			private ["_error"];
		
			_error = format [localize "STR_SPON_CORE_OLD_VERSION", _tag, _component, _version, _currentVersion]
			SPON_ERROR(_error);
				
			_valid = false;
		}
		else
		{
			_valid = true;
		};
	};
	
	SPON_TRACE_3("SPON_registerVersion",_tag,_component,_version);
	
	_valid; // Return.
};

// ---------------------------------------------------------------------------
SPON_requireVersion =
{
	SPON_GET_PARAMS_3(_tag,_component,_requiredVersion);
	
	private ["_versionVariable", "_currentVersion", "_valid"];
	
	_versionVariable = _tag + "_" + _component + "_version";
	_currentVersion = call compile format
		['if (isNil "%1") then { nil } else { %1 };', _versionVariable];
	
	if (isNil "_currentVersion") then
	{
		private ["_error"];
		
		_error = format [localize "STR_SPON_CORE_REQUIRED_VERSION_MISSING",
			_tag, _component, _version];
		SPON_ERROR(_error);
		_valid = false;
	}
	else
	{
		if (([_currentVersion, _requiredVersion] call SPON_compareVersions) < 0) then
		{
			private ["_error"];
		
			_error = format [localize "STR_SPON_CORE_REQUIRED_VERSION_OLD",
				_tag, _component, _version, _currentVersion];
			SPON_ERROR(_error);
			
			_valid = false;
		}
		else
		{
			_valid = true;
		};
	};
	
	_valid; // Return.
};

// ---------------------------------------------------------------------------
SPON_compareVersions =
{
	SPON_GET_PARAMS_3(_versionA,_versionB);
	
	private ["_arrayA", "_arrayB", "_comparison"];
	
	_arrayA = [_versionA, "."] call SPON_splitString;
	_arrayB = [_versionB, "."] call SPON_splitString;
	
	for "_i" from 0 to ((count _arrayA) - 1) do
	{
		if ((_arrayA select _i) > (_arrayB select _i)) exitWith
		{
			_comparison = +1;
		}
		else{if ((_arrayA select _i) < (_arrayB select _i)) exitWith
		{
			_comparison = -1;
		};
	};
	
	if (isNil "_comparison") then
	{
		if ((count _arrayA) > (count _arrayB)) then
		{
			_comparison = +1;
		}
		else{if ((count _arrayA) < (count _arrayB)) then
		{
			_comparison  = -1;
		}
		else
		{
			_comparison = 0;
		}; };
	};
	
	_comparison; // Return.
};
