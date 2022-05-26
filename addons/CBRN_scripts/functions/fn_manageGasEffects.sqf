/*
	Manages the effects of gas on the afflicted unit
*/

_unit 			= param[0]; 
_exposure 		= param[1, 0];
_incrementGas	= param[2,0];
_type 			= param[3];
_aceDetected 	= param[4, false];

//Exposure scaled from 0 to 1
_scaled 		= _exposure / 100; 
_lastScaled 	= (_unit getVariable ["lastScaled", 0]);
_thres 			= (_unit getVariable ["unconciousThres",1]);

if(_scaled > 0 and {_incrementGas > 0.1}) then {
	_lastSound = _unit getVariable ["_soundDelay", time+10];
	if(time > _lastSound) then {
		private _soundsArray = CBRN_Choke_Sounds;
		private _sound = selectRandom _soundsArray;
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
		//Ace
		
		if(_aceDetected) then {
			//Parts of this code have been taken from Assaultboy's mod since I don't know much about ACE
			//https://github.com/assaultboy/ChemicalWarfare/blob/master/addons/CBRN_scripts/functions/fn_effectsHandler.sqf
			if ((_exposure > 0) && ((_unit getVariable ["ace_medical_pain", -1]) < 0.25)) then {_unit setVariable ["ace_medical_pain", 0.25]};

			if(_scaled > 0.5) then {
				_unit forceWalk true;
			} else {
				_unit forceWalk false;
			};

			if(_scaled > _thres and {CBRN_allowUnconcious}) then {
				[_unit, true, 300] call ace_medical_fnc_setUnconscious
			} else {
				[_unit, false, 300] call ace_medical_fnc_setUnconscious
			};

			if (_exposure == 1) then {_unit setDamage 1};

			systemChat "ACE";
		}
		//No ace? 
		else {
			//Increase damage
			_currentDamage = damage _unit;
			_unit setDamage (_scaled + _currentDamage - _lastScaled);

			//Fatigue
			//_currentFatigue = getfatigue _unit;
			//_unit setFatigue  (_scaled + _currentFatigue - _lastScaled);

			//Should be set unconcious
			if(_scaled > _thres and {CBRN_allowUnconcious}) then {
				_unit setUnconscious true;
			} else {
				_unit setUnconscious false;
			};

			if(_scaled > 0.5) then {
				_unit forceWalk true;
			} else {
				_unit forceWalk false;
			};
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
		
		//_currentFatigue = getfatigue _unit;
		//_unit setFatigue  (_scaled + _currentFatigue - _lastScaled);
	};

	//Asphyxiant - will add l8er
	case 2: {
		if(_scaled == 1) then {
			_unit setDamage 1;
		};

		//_unit setFatigue  _scaled;
	};

	default {};
};

true;