

sleep 60;

fncAddTask = {
  switch _this do {
    case 0: {
      tskobj_1 = player createsimpletask ["Destory the Weapons Cache Alpha"];
      tskObj_1 setSimpleTaskDescription["Destory the Weapons Cache Alpha <marker name='mkrOBJ01'>Weapons Cache Alpha</marker>.", "Primary: Destory Weapons Cache Alpha.", "Weapons Cache Alpha"];
	  tskObj_1 setSimpleTaskDestination (getMarkerPos "mkrOBJ01");
      player setcurrenttask tskobj_1;
	  [tskobj_1] call mk_fTaskHint; // tell the player
	  
    };
    case 1: {
      tskobj_2 = player createsimpletask ["Destory the Weapons Cache Bravo"];
      tskObj_2 setSimpleTaskDescription["Destory the Weapons Cache Bravo <marker name='mkrOBJ02'>Weapons Cache Bravo</marker>.", "Primary: Destory Weapons Cache Bravo.", "Weapons Cache Bravo"];
	  tskObj_2 setSimpleTaskDestination (getMarkerPos "mkrOBJ02");
      player setcurrenttask tskobj_2;
	  [tskobj_2] call mk_fTaskHint; // tell the player
    };
    case 2: {
      tskobj_3 = player createsimpletask ["Destory Charlie Target"];
      tskObj_3 setSimpleTaskDescription["Destory Charlie Target <marker name='mkrOBJ03'>Mark</marker>.", "Primary: Destory Charlie.", "Charlie"];
	  tskObj_3 setSimpleTaskDestination (getMarkerPos "mkrOBJ03");
      player setcurrenttask tskobj_3;
	  [tskobj_3] call mk_fTaskHint; // tell the player
    };
    case 3: {
      tskobj_4 = player createsimpletask ["Destory Delta Target"];
      tskObj_4 setSimpleTaskDescription["Destory Delta Target <marker name='mkrOBJ04'>Mark</marker>.", "Primary: Destory Delta.", "Delta"];
	  tskObj_4 setSimpleTaskDestination (getMarkerPos "mkrOBJ04");
      player setcurrenttask tskobj_4;
	  [tskobj_4] call mk_fTaskHint; // tell the player
    };
    case 4: {
      tskobj_5 = player createsimpletask ["Destory Echo Target"];
      tskObj_5 setSimpleTaskDescription["Destory Echo Target <marker name='mkrOBJ05'>Mark</marker>.", "Primary: Destory Echo.", "Echo"];
	  tskObj_5 setSimpleTaskDestination (getMarkerPos "mkrOBJ05");
      player setcurrenttask tskobj_5;
	  [tskobj_5] call mk_fTaskHint; // tell the player
    };
  };
};
fncPickTask = {
  if isserver then {
    if (count tasks == 0) then {
      theEnd = true;
      publicvariable "theEnd";
    } else {
      addTask = tasks select (floor random count tasks);
      tasks = tasks - [addTask];
      publicvariable "addTask";
      if !isdedicated then { addTask call fncAddTask };
    };
  };
};

theEnd = false;
if isserver then {
  tasks = [];
  for "_i" from 0 to (taskCount - 1) do {
    tasks set [_i,_i];
  };
} else {
  [] spawn {
    waituntil {!isnil "addTask"};
    addTask call fncAddTask;
    "addTask" addpublicvariableeventhandler {(_this select 1) call fncAddTask};
  };
};

call fncPickTask; // add first task for briefing




