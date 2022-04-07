/*
	Handles grenades
*/

_ammo = param [0];
_projectile = param [1];

_gasArray = getArray (configFile >> "cfgAmmo" >> _ammo >> "CBRN_gasType");
_isGas = !(_gasArray isEqualTo []);

if(_isGas) then {
	//Having problems sending "true" trough c++... 
	switch (_gasArray select 4) do {
		case 0: {_gasArray set [4, false];};
		case 1: {_gasArray set [4, true];};
		default {}; 
	};

	[_projectile, _gasArray] spawn {
		_projectile = _this select 0;
		_selGas = _this select 1;
		_pos = position _projectile;
		while {alive _projectile} do {
			_pos = position _projectile;
			sleep 0.01;
		};

		"smokeShell" createVehicle _pos;
		[_pos, _selGas] spawn CBRN_fnc_makeGasArea;
	};
};


true;