_slider = 720;

lbClear 72011;
/////////////////////////////////////////////////////////////////////

_music = configFile >> "CfgMusic";
for "_i" from 0 to ((count _music) - 1) do
{
	_track = _music select _i;
	if (isClass _track) then
	{
		_title = getText (_track >> "name");

		_index = lbAdd [72011, _title];
		lbSetData [72011, _index, configName _track];
	};
};
lbSetCurSel [72011,0];


sliderSetRange [_slider, 0, 1];
_volume = musicVolume;
sliderSetPosition [_slider, (1 - _volume)];
