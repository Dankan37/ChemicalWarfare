/*
	Params:
		-position
		-time 
		-shellType
	
	Description:
		This script creates a smoke shell on a position every 60 seconds for _time

	Usage:
		[_position, 300] spawn CBRN_fnc_smokeForTime;
*/

//Function not used since gas shells don't emit smoke actively
/*
_position	= param[0];
_time 		= param[1, 300];
_shellType 	= param[2, "SmokeShell", ["hello"]];
_loopTime	= param[3, 60];

_smoke = "SmokeShell" createVehicle _position;

//Average shell life is 60 seconds
_i = floor (_time / _loopTime);

for "_k" from 0 to _i do {
	_smoke = _shellType createVehicle _position;
	sleep _loopTime;
};

/*
_smoke = _shellType createVehicle _position;
sleep (_time - _i*60);
_smoke enableSimulation false;
_smoke hideObjectGlobal true;
*/
true;