_unit 	= param[0, objNull, [objnull]];

//Check local
//if (!local _unit) exitWith {};

//Already has handler 
//given how things are setup, putting this first will save some time
if(_unit getVariable ["hasHandler",false]) exitWith {};

//Was the unit set immune?
if(_unit getVariable ["immune", false]) exitWith {};

//Don't worry about UAVs
if (unitIsUAV _unit) exitWith {};

//Exposure to each gas type
_unit setVariable ["Exposure", [0,0,0]];

//Increment of each type, by knowing how much it's increasing we also know IF it's increasing.
_unit setVariable ["Increment", [0,0,0]]; 

//Delay used for coughting
_unit setVariable ["_soundDelay", 0];

//Skill issues
_unit setVariable ["allowSkill", true];
_unit setVariable ["baseSkilLevel", skill _unit];
_unit setVariable ["lastScaled", 0];

//Unit main googles
_unit setVariable ["chachedGoogles", ""];

//fall unconscious threshold
_fixedRandom = 2;
if(CBRN_allowUnconcious) then {
	_fixedRandom = (0.7 + random 0.7);
};
_unit setVariable ["unconciousThres", _fixedRandom];

//Add this at the end to make sure stuff has been setup correctly
_unit setVariable ["hasHandler", true];