//Merge all the gas types for quick access; used in handleEventFired
CBRN_gasArray = [gasSarin, gasTear, gasVX];

//attach the gas event handler to the mission
call CBRN_fnc_manageEventHandlers;

//manage the custom uniforms and masks
[CBRN_uniformArray, CBRN_maskArray] call CBRN_fnc_setupUniforms;
