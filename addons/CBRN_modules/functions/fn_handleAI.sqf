/*
	DESCRIPTION:
		This function is used by the zeus module to remove exposure from a given unit
		This function is called automatically by the module
		
	PARAMETERS:
		Logic
			The logic object
		
		Unit
			Affected units
			
		Activated
			Has the module been activated
			
	RETURNS
		Nothing
		
	EXAMPLE
		_this call CBRN_fnc_moduleRemoveExposure
*/

params ["_logic","_unit","_activated"];

//Only worry about the curators machine
if (!local _logic) exitWith {};

private _logicType = getText (configFile >> "cfgVehicles" >> typeOf _logic >> "CBRN_type");

//Fun begins now
if(isNil "_logicType") then {
	deleteVehicle _logic;
};
if(isNil "_logicType") exitWith {};

switch (_logicType) do {
	case "immune": {
		private _target = [_logic, [
			[{true}, "PLACE ON A UNIT"]
		]] call CBRN_fnc_moduleHandleCuratorPlacement;

		if (isNull _target) exitWith{};
		_state = !(_target getVariable ["immune", false]);
		_target setVariable ["immune", _state, true];
		["Immune", str _state, 3] call BIS_fnc_curatorHint;
	};

	case "ignore": {
		private _target = [_logic, [
			[{true}, "PLACE ON A GROUP"]
		], "GROUP"] call CBRN_fnc_moduleHandleCuratorPlacement;

		if (isNull _target) exitWith{};
		_state = !(_target getVariable ["ignoreCBRN", false]);
		_target setVariable ["ignoreCBRN", _state, true];
		["Ignore", str _state, 3] call BIS_fnc_curatorHint;
	};

	case "exposure": {
		private _target = [_logic, [
			[{true}, "PLACE ON A UNIT"]
		]] call CBRN_fnc_moduleHandleCuratorPlacement;
		if (isNull _target) exitWith{};
		_target setVariable ["Exposure", [0,0,0], true];
		["Esposure reset", "Exposure set to 0", 3] call BIS_fnc_curatorHint;
	};
	default {}; 
};

deleteVehicle _logic;
true;