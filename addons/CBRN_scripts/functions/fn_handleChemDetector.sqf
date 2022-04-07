/*
	handles the chemical detector 

	_display: number to display max 9.99
*/

_display = param[0];

"ChemicalDetector" cutRsc ["RscWeaponChemicalDetector", "PLAIN", 1, false];
_ui = uiNamespace getVariable "RscWeaponChemicalDetector";
_ctrl = _ui displayCtrl 101;

_threat = [_display, 2] call BIS_fnc_cutDecimals;
_ctrl ctrlAnimateModel ["Threat_Level_Source", _threat, true];

true;