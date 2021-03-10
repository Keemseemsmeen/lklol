/*****************************************************************************
  Scriptname: 
	onButtonClick_dump.sqf
  Author: 
	HeliJunkie
	
  Description:
  Handles button click for dumping class names to edit box
  
  Input:
	not needed
	
  Returns:
	nothing
*****************************************************************************/


scriptname "onBC_dump.sqf";
private ["_lbIDC", "_outputIDC", "_size", "_outText", "_crlf"];

_lbIDC = 110;
_outputIDC = 113;
_size = lbSize 110;
_outText = "";
_crlf = "
";
// 
// clear output box
//
ctrlSetText [_outputIDC,""];

//
// iterate throu entries of list box
//
for "_x" from 0 to (_size - 1) do {
	// diag_log text format ["%1", lbtext [_lbIDC,_x]];
	_outText = _outText + format["class %1;",lbtext [_lbIDC,_x]] + _crlf;
};
ctrlSetText [_outputIDC,_outText];

