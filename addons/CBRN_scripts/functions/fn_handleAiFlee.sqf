/*
	Makes an AI group flee to a "relative" position based on a given position.
*/

_unit 		= param[0];
_dist 		= param[1];
_pos 		= param[2];
_time 		= param[3, 300];

//Leader _x was passed as the argument
_lead = _unit;
if(_lead == objNull) exitWith {};

//Stops spam
if(isPlayer _lead) exitWith {};

_grp = group _unit; 
_isFleeing = _grp getVariable ["isFleeing",false];
if (_isFleeing) exitWith {};

//Finally we're up to real business
//we delete waypoints to prevent the AI going back into the gas (the one they are fleeing from at least)
/*
_wps = waypoints _grp;
{
	deleteWaypoint _x;
}forEach _wps;
*/

//Temporary position and relative vector, TODO: Bring them from b4
_tPos = position _unit;
_posVec = [(_tPos select 0) - (_pos select 0), (_tPos select 1) - (_pos select 1), 0];

//Turn this into a direction 
_dir = vectorNormalized _posVec;
_newPos = [0,0,0];

//X and Y
for "_i" from 0 to 1 do {
	_val 		= ((_dir select _i) * _dist * 1.2);
	_posComp 	= _tPos select _i;
	_newComp 	= _posComp + _val;
	_newPos set [_i, _newComp];
};

_wp = _grp addWaypoint [_newPos, 4];
_wp setWaypointType "Move";
_grp setCurrentWaypoint _wp;

//expedite
_grp setVariable ["isFleeing",true];
_grp setSpeedMode "FULL";
_grp setBehaviour "AWARE";
_grp move _newPos;

//We check if the new area is safer 
_timeMax = (time + _time);
while {_timeMax > time} do {
	sleep 30;
	_exp = (_unit getVariable ["Increment",[0,0,0]]);
	for "_i" from 0 to 2 do {
		if(_exp select _i > 0.02) then {
			_grp setVariable ["isFleeing",false];
		};
	};
};

_grp setVariable ["isFleeing",false];
_grp move _tPos;