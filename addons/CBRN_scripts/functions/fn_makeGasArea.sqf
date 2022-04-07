/*
	creates gas in an area and handles nearby units

	Position;
	gasType: array containing all parameters for each gas
	logicObject: the logic object this function is attached to, if it ceases to exist, function is left prematurely.
*/

_position 		= param[0, [0,0,0], [[0,0,0]]];
_gasType 		= param[1, [80, 600, 2, 60, true, 0, 2], [[]]];
_logicObject	= param[2, objNull];

//We passed gasType as an array
_radius			= _gasType select 0;
_time 			= _gasType select 1;
_strenght 		= _gasType select 2;
_timeToSpread 	= _gasType select 3;
_windAffected 	= _gasType select 4;
_type 			= _gasType select 5;
_minProtection	= _gasType select 6;

//Handle logic
if(isNull _logicObject) then {
	_logicCenter = createCenter sideLogic;
	_logicGroup = createGroup _logicCenter;
	_logicObject = _logicGroup createUnit ["Logic", [0,0,0], [], 0, "NONE"];
};

//Safety checks
if(_time < 0) exitWith {};
if(_timeToSpread < 1) then {_timeToSpread = 1};
_strenght = abs(_strenght);

//Values which we might need
//relative direction from center to unit
_relDir = 0;
//cosine of relative angle
_cangle = 1;
//Values are precalculated every _step meters
_step = 3;

//How long the gas stays active
_timeMax = (time + _time);

//Save the values for quick calculations
_valueArray = [-(_strenght/100), _radius, _step] call CBRN_fnc_cacheFunctionValues;

//Save all the units that have been subjected to this gas
_backUnits = [];

//Make me into a function? 
while {_timeMax > time} do {
	if(isNull _logicObject) exitWith {};

	//becomes 1 with time
	_dinamicRadius = (selectMin[time / _timeToSpread, 1]) * _radius;

	//if no wind why bother?
	_windMag = (vectorMagnitude wind);
	_windEnable = (_windMag != 0 and _windAffected);
	_inverseMag = (1/(_windMag+0.1) min 1); //Cheeky way to prevent 1/0

	//main loop
	_units = _position nearEntities [["Man", "StaticWeapon"], _dinamicRadius];
	{
		//Was the unit set immune?
		_immune = (_x getVariable ["immune", false]);
		if (_immune) then {continue;};

		//Is this a turret?
		_isWeapon = typeof _x isKindOf "StaticWeapon";
		if(_isWeapon) then {
			_x = gunner _x;
		};

		//Some checks to prevent errors
		if(!isNull _x and alive _x) then {
			//first we check if the unit is protected
			_protection = [_x] call CBRN_fnc_getProtectionLevel;
			_increment = 0;

			_distance 	= _position distance2D _x;
			_unProtected = (_protection < _minProtection);

			//If there is wind and it's enabled we calculate it's effects
			if (_windEnable) then {
				//Temporary position
				_tPos = position _x;
				//Relative vector 
				_posVec = [(_tPos select 0) - (_position select 0), (_tPos select 1) - (_position select 1), 0];
				//Cosine angle between vectors: wind and relative
				_cangle = (wind vectorCos _posVec) * 2;

				//Value depends on the speed of the wind
				//If wind is blowing fast in one direction units on the other side gets the max between a negative and a small number
				_cangle = selectMax[_inverseMag, _cangle]; 
			} else {
				//If wind stops we need to update the value
				_cangle = 0.75;
			};

			//Main formula
			_precalculatedValue = [_valueArray, _step, _distance] call CBRN_fnc_smartIndexSearch; //0.007 ms
			//_incrementUnprotected 	= (_e ^ -(_strenght/100 * _distance) * _cangle); //0.015 ms
			_increment = _precalculatedValue * _cangle;

			//gets the unit exposure
			_currExposure = _x getVariable "Exposure";
			_incrementArray = _x getVariable "Increment";

			//weird error near buildings idk
			if(!isNil "_currExposure" and {!isNil "_incrementArray"}) then {
				//Update the exposure array
				if(_unProtected) then {
					//We add the increment to the current exposure based on the gas type
					_newValue = ((_currExposure select _type) + _increment);
					_currExposure set [_type, _newValue];
				};
				
				//Update Increment array
				_incrementArray set [_type, _increment];
			};

			_ignore = ((group _x) getVariable ["ignoreCBRN",false]);
			//Not protected 
			if(!_ignore and {_unProtected}) then {
				//better get tf out of here!
				_distToBorder = (_radius - _distance);
				[leader _x, _distToBorder, _position, _time] spawn CBRN_fnc_handleAiFlee;
			};
		};

		//We save the unit into the ones which have been afflicted
		_backUnits pushBackUnique _x;
	}forEach _units;

	//If unit has left the area we set the increment to 0
	{
		//TODO optimize find 
		_i = _units find _x;
		//_i = -1 if not found
		if(_i == -1) then {
			_arr = _x getVariable "Increment";
			if (!isNil "_arr") then {
				_arr set [_type, 0];
				_backUnits deleteAt _i;
			};
		};
	}forEach _backUnits;

	sleep 0.5;
};

//Reset the exposed once the gas finishes
{
	_exposed = _x getVariable "Increment";
	if(!isNil "_exposed") then {
		_exposed set [_type, 0];
		_x setVariable ["Increment", _exposed];
	};
}forEach _backUnits;
