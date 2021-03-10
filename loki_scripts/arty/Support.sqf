_shellClass = _this select 0;
_pos = _this select 1;
_shellsInBarrage = _this select 3;
_numBarrages = _this select 4;
_height = _this select 5;

			for "_i" from 1 to _numBarrages do
			{											
				for "_j" from 1 to _shellsInBarrage do
				{
					_round = _shellClass createVehicle [_pos select 0, _pos select 1, (_pos select 2) + 200];
					
	
				};	
				
			};

hint  "Support Inbound...";			