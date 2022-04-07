/*
	Handles artillery fire
*/

_ammo = param [0];
_projectile = param [1];

_gasType = getNumber (configFile >> "cfgAmmo" >> _ammo >> "CBRN_gasType");
_isGas = !isNil "_gasType";
if(_isGas) then {
	_selGas = CBRN_gasArray select _gasType;
	[_projectile, _selGas] spawn {
		_projectile = _this select 0;
		_selGas = _this select 1;

		_pos = position _projectile;
		while {alive _projectile} do {
			_pos = position _projectile;
			sleep 0.01;
		};

		[_pos, _selGas] spawn CBRN_fnc_makeGasArea;
	};
};


true;