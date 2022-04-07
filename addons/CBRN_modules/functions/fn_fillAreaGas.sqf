params ["_logic", "_unit", "_activated"];

//This will reveal the circle to the curator
if ({local _x} count (objectCurators _logic) > 0) then {
    _logic hideObject false;
    _logic setPos position _logic;
};

//Handle the rest on the server
if !(isServer) exitWith {};

//Create our pos 500m above the logic
[position _logic, [200, 99999, 2, 60, true, 0, 2], _logic] spawn CBRN_fnc_makeGasArea;

true;