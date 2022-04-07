params ["_logic", "_unit", "_activated"];

//Only worry about the curators machine
if (!local _logic) exitWith {};

//Get our selected unit or fail gracefully
private _unit = [_logic, [
	[{_this isKindOf "CAManBase"}, "PLACE ON A UNIT"]
]] call CBRN_fnc_moduleHandleCuratorPlacement;

//If we failed we can just leave
if (isNull _unit) exitWith{};

_side = side _unit;
_uniform = "";

switch (_side) do {
	case west: {
		_uniform = "U_B_CBRN_Suit_01_MTP_F";
	};
	case east: {
		_uniform = "U_O_CombatUniform_ocamo";
	};
	case independent: {
		_uniform = "U_I_CBRN_Suit_01_AAF_F";
	};

	default {
		_uniform = "U_C_CBRN_Suit_01_Blue_F";
	};
};

{
	_x addUniform _uniform;
	_x linkItem "G_AirPurifyingRespirator_01_F";
}forEach units group _unit;

deleteVehicle _logic;
true;