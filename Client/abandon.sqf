private["_result"];
disableSerialization;
_result = ["Do you really want to abandon your territory?", "Confirm", "Yes", "Nah"] call BIS_fnc_guiMessage;
waitUntil { !isNil "_result" };
if (_result) then
{
	_tFlag = nearestObject [player, "Exile_Construction_Flag_Static"];
	_owner = _tFlag getVariable ["ExileOwnerUID", ""];
	if !(_owner isEqualTo getPlayerUID player) exitWith 
	{
		["ErrorTitleOnly", ["Only the territory owner can do this"]] call ExileClient_gui_toaster_addTemplateToast;
	};
	_pos = getPosATL _tFlag;
	_territoryName = _tFlag getVariable ["ExileTerritoryName", 0];
	abandon = [_tFlag,_pos,player,getPlayerUID player,_territoryName];
	uiSleep 0.2;
	publicVariableServer "abandon";
	uiSleep 0.2;
	deletevehicle _tFlag;
};
true