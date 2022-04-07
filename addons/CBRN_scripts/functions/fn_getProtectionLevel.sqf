/*
	DESCRIPTION:
		This function will return the level of contamination the given unit is protected against
		
	PARAMETERS:
		Unit
			The unit to check
			
	RETURNS
		Protection Level
			0..2 level of protection (0 being no protection at all)
		
	EXAMPLE
		player call CBRN_fnc_getProtectionLevel
*/

params ["_unit"];

_uniform = uniform _unit;
_googles = goggles _unit;

//Get our config values
private _maskLevel = getNumber (configFile >> "cfgGlasses" >> _googles >> "CBRN_protectionLevel");
private _suitLevel = getNumber (configFile >> "cfgWeapons" >> _uniform >> "CBRN_protectionLevel");

//Combine our flags - so long gay bowser
//private _flags = ([_maskLevel, _suitLevel] call BIS_fnc_bitwiseOR) call BIS_fnc_bitFlagsToArray;
//_flags = (_maskLevel + _suitLevel) call BIS_fnc_bitFlagsToArray;

//private _faceCovered = 1 in _flags;
//private _bodyCovered = 2 in _flags;

private _faceCovered = (_maskLevel == 1);
private _bodyCovered = (_suitLevel == 1);

if(!_faceCovered) then {
	_faceCovered		= missionNamespace getVariable ["CBRN_" + _googles, false];
};
if(!_bodyCovered) then {
	_bodyCovered 		= missionNamespace getVariable ["CBRN_" + _uniform, false];
};

//First check if we are fully covered
if (_faceCovered && _bodyCovered) exitWith {2};

//If we don't even have that, check if the face is covered
if (_faceCovered) exitWith {1};

//Fuckin naked mate
0;

/*
Tested with 200 both protected and unprotected units (50/50)
Result:
Before
18.0893 ms

Cycles:
56/10000

Code:
{_a = [_x] call CBRN_fnc_getProtectionLevel;} forEach allUnits;

After
Result:
2.95858 ms

Cycles:
338/10000

Code:
{_a = [_x] call CBRN_fnc_getProtectionLevel;} forEach allUnits;

Still needs room for improvement