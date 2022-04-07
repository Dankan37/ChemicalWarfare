/*
	Used internally, just reeturns the closest precached calculation
*/

_arrayValues 	= param[0];
_increment		= param[1];
_value			= param[2];

_arrayValues append [0];
_index = floor(_value/_increment);

(_arrayValues select _index);