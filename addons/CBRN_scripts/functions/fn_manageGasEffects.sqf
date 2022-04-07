/*
	Manages the effects of gas on the afflicted unit
*/

_unit 			= param[0]; 
_exposure 		= param[1, 0];
_incrementGas	= param[2,0];
_type 			= param[3];

//Exposure scaled from 0 to 1
_scaled 		= _exposure / 100; 
_lastScaled 	= (_unit getVariable ["lastScaled", 0]);
_thres 			= (_unit getVariable "unconciousThres");

if(_scaled > 0 and {_incrementGas > 0.1}) then {
	_lastSound = _unit getVariable "_soundDelay";
	if(time > _lastSound) then {
		_soundsArray = CBRN_Choke_Sounds;
		_sound = selectRandom _soundsArray;
		playsound3d [_sound, _unit, false, getPosasl _unit, 15,1,30];
		_unit setVariable ["_soundDelay", 5 + time + random 30];	
	};
};

switch (_type) do {
	//Sarin/VX gas
	case 0: {
		if(hasInterface and isPlayer _unit) then {
			_val = _exposure/50;
			addCamShake [_val, 2, 2];
			//[_val] call CBRN_fnc_blurScreen;
		};

		//Increase damage
		_currentDamage = damage _unit;
		_unit setDamage (_scaled + _currentDamage - _lastScaled);

		//Fatigue
		_unit setFatigue  _scaled*2;

		//Should be set unconcious
		if(_scaled > _thres) then {
			_unit setUnconscious true;
		} else {
			_unit setUnconscious false;
		};

		if(_scaled > 0.5) then {
			_unit forceWalk true;
		} else {
			_unit forceWalk false;
		};

		//Save scaled
		_unit setVariable ["lastScaled", _scaled];
	};

	//Tear gas
	case 1: {
		if(hasInterface and isPlayer _unit) then {
			_val = _scaled * 8;
			[_val] call CBRN_fnc_blurScreen;
		};
		
		_unit setFatigue  _scaled;
	};

	//Asphyxiant - will add l8er
	case 2: {
		if(_scaled == 1) then {
			_unit setDamage 1;
		};

		_unit setFatigue  _scaled;
	};

	default {};
};

true;