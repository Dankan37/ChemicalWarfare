/*
	Each loop updates the unit exposure, handles the effects of gas, handles masks and chem detector
*/

_unit 			= param[0];
_exposureArray 	= param[1];
_incrementArray	= param[2];
_decayArray		= param[3]; 			

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
	[_unit, _selExposure, _selIncrement, _i] call CBRN_fnc_manageGasEffects;

	//Save the sum
	_sum = (_sum + _selExposure);
};

//Manage AI Skill - todo add check
private _fixedSkill 	= (_unit getVariable "baseSkilLevel");
_unit setSkill selectMax[0, (_fixedSkill - _sum/100)];


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