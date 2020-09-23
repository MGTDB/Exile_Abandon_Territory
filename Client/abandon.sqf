private["_result","_result2","_tFlag","_moderators","_pos","_territoryName","_stolen","_crate","_cargoToAdd","_type","_filter","_kitMagazine","_size","_level"];
disableSerialization;
_result = ["Do you really want to abandon your territory?", "Abandon Territory Info", "continue"] call BIS_fnc_guiMessage;
_result2 = ["Abandon territory", "Abandon Territory confirmation", "Yes", "No"] call BIS_fnc_guiMessage;
waitUntil { !isNil "_result2"};
if (_result2) then
{
	_tFlag = nearestObject [player, "Exile_Construction_Flag_Static"];
	_moderators = _tFlag getVariable ["ExileTerritoryModerators", []];
	if !(getPlayerUID player in _moderators) exitWith 
	{
	  	["ErrorTitleOnly", ["Only the territory owner or moderators can do this"]] call ExileClient_gui_toaster_addTemplateToast;
	};
	_pos = getPosATL _tFlag;
	_territoryName = _tFlag getVariable ["ExileTerritoryName", 0];
	_size = _tFlag getVariable ["ExileTerritorySize", 0];
	_level = _tFlag getVariable ["ExileTerritoryLevel", 0];
	_stolen = false;
	if !((_tFlag getvariable ['ExileFlagStolen',1]) isEqualTo 0) then
	{
		_stolen = true;
	};	
	_cargoToAdd = [];
	if!(_stolen)then
	{
		_cargoToAdd pushBack "Exile_Item_Flag";
	};	
	abandon = [_tFlag,_pos,player,getPlayerUID player,_territoryName,_level,_cargoToAdd,_size];
	uiSleep 0.2;
	publicVariableServer "abandon";
	uiSleep 0.2;
	deletevehicle _tFlag;
};
true