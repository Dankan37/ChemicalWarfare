/*
	Precalculates a function (e^-ax) values at fixed points spaced by "_incr"
*/

_exponent 	= param[0];
_radius		= param[1];
_incr 		= param[2, 10];

_cached 	= [];
_loops 		= ceil _radius/_incr;
_skipNext = false;


for "_i" from 0 to _loops do {
	_value = 0;
	if(!_skipNext) then {
		_value = exp (_exponent * _i * _incr);
	};
	
	//If values are too small we add zero instead
	//Since e^-x is decreasing, next values will be smaller
	if(_value < 0.0005) then {
		_value = 0;
		_skipNext = true;
	};

	_cached pushBack _value;
};

_cached;
