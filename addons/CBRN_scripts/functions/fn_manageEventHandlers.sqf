CBRN_ppBlur = ppEffectCreate ["DynamicBlur", 10];
if(!isServer) exitWith {};

//We get this now and pass it everytime
CBRN_ACEdetected = (isClass(configfile >> "CfgPatches" >> "ace_medical"));
CBRN_frameIndex = 0;
addMissionEventHandler ["EachFrame", {
	//Every 30 frames
	if(CBRN_frameIndex == 30) then {
		CBRN_frameIndex = 0;
		//Just schedule this to be executed, no hurry, we have 30 frames
		[] spawn {
			{
				//If the unit is immune we skip to the next loop
				private _immune = (_x getVariable ["immune", false]);
				if (_immune) then {continue;};

				private _hasHandler = (_x getVariable ["hasHandler",false]);
				if(_hasHandler) then {
					//Get the values to be used
					private _exposureArr 		= _x getVariable "Exposure";
					private _incrementArr 		= _x getVariable "Increment";

					//Do your thing
					if(!isNil "_exposureArr" and {!isNil "_incrementArr"}) then {
						_id = owner _x;
						[_x, _exposureArr, _incrementArr, [0.1, 1, 0], CBRN_ACEdetected] remoteExec ["CBRN_fnc_manageGasExposure", _id];
					};
				} else {
					//Setup the unit
					[_x] call CBRN_fnc_addGASEventHandlers;
				};
			}forEach allUnits;
		};
	};
	//Next frame
	CBRN_frameIndex = CBRN_frameIndex + 1;
}];