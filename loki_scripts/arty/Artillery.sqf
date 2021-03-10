_shellClass = _this select 0;
_pos = _this select 1;
_deviation = _this select 2;
_shellsInBarrage = _this select 3;
_numBarrages = _this select 4;

hint  "Artillery Inbound...";

			for "_i" from 1 to _numBarrages do
			{											
				for "_j" from 1 to _shellsInBarrage do
				{
					_shell = _shellClass createvehicle [0,0];
					_shell setpos [((_pos select 0)+(random _deviation) - (random _deviation)),((_pos select 1) +(random _deviation) - (random _deviation)), 400 + random 0 ];
					sleep (0.3 + (random 0.3));		
				};	
			sleep 7;				
			};

			