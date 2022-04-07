_uniformsArray 	= param[0, [], [[]]];
_masksArray 	= param[1, [], [[]]];
_tag = "CBRN_";

{
	_str = [_tag, _x] joinString "";
	if(_str != _tag) then {
		missionNamespace setVariable [_str, true];
	};
}forEach _uniformsArray + _masksArray;

true;