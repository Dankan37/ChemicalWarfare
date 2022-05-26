/*
	Each loop updates the unit exposure, handles the effects of gas, handles masks and chem detector
*/

_unit 			= param[0];
_exposureArray 	= param[1];
_incrementArray	= param[2];
_decayArray		= param[3]; 	
_aceDetected 	= param[4, false];		

//Sum of all effects used for skill deduction
_sum = 0;
for "_i" from 0 to 2 do {
	private _selIncrement 	= _incrementArray select _i;
	private _selExposure	= _exposureArray select _i;
	
	private _currentExposure = 0;
	//Unit is no longer exposed and was exposed
	if(_selIncrement == 0 and {_selExposure > 0}) then {
		_currentExposure 			= _selExposure;
		private _selDecay 			= (_decayArray select _i);
		private _currentExposure 	= (_currentExposure - _selDecay); 
		private _currentExposure	= (0 max _currentExposure);

		//Update the value
		_exposureArray set [_i, _currentExposure];
	};

	//Manage the gas effects for each of the gas types
	[_unit, _selExposure, _selIncrement, _i, _aceDetected] call CBRN_fnc_manageGasEffects;

	//Save the sum
	_sum = (_sum + _selExposure);
	//systemChat str _sum;
};

//Manage AI Skill - todo add check
if(CBRN_allowSkillChange and {_unit getVariable ["allowSkill", false];}) then {
	private _skill = skill _unit;
	private _lastSkill = (_unit getVariable ["lastSkill", _skill]);
	
	//Check if the skill has changed radically (by human, zeus)
	if(abs(_lastSkill - _skill) > 0.2) then {
		//In this case we update it to the new value to prevent it being constantly overwritten
		_unit setVariable ["baseSkilLevel", _skill];
	};

	private _fixedSkill = (_unit getVariable ["baseSkilLevel", _skill]);
	private _newSkill = (_fixedSkill - _sum/100);
	if(_newSkill > 0) then {
		_unit setSkill _newSkill;
	};
	_unit setVariable ["lastSkill", _fixedSkill];
};

//Stuff for players
if(isPlayer _unit and hasInterface) then {
	_value = (_incrementArray select 0);
	//Update chem detector
	[_value] call CBRN_fnc_handleChemDetector;

	//Get the unit googles
	_currentGoogles = goggles _unit;
	_chachedGoogles = _unit getVariable "chachedGoogles";

	//Taken somehwat from Assaultboy
	//Compare it with the previous ones, only do something if we find a difference
	if (_currentGoogles != _chachedGoogles) then {
		//Update googles
		_unit setVariable ["chachedGoogles", _currentGoogles];

		//Add overlay
		_hasOverlay = getNumber (configFile >> "cfgGlasses" >> _currentGoogles >> "CBRN_hasOverlay");
	
		//1 means it has an overlay, nil or 0 means no
		if (_hasOverlay == 1) then {
			"gasMask" cutRsc ["RscCBRN_APR", "PLAIN", 1, false];
		} else {
			"gasMask" cutRsc ["RscTitleDisplayEmpty", "PLAIN", 1, false];
		};
	};
};

true;