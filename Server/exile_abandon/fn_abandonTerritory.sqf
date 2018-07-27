if(isServer) then
{
	"abandon" addPublicVariableEventHandler {_this select 1 call abandon_territory};
	abandon_territory =
	{	
		private ["_tFlag","_location","_player","_playerUID","_territoryName","_objectID","_territoryLog"];
		_tFlag = _this select 0;
		_location = _this select 1;
		_player = _this select 2;
		_playerUID = _this select 3;
		_territoryName = _this select 4;
		_objectID = _tFlag getVariable ['ExileDatabaseID',-1];
		if!(_objectID isEqualTo -1)then
		{
			format['deleteTerritory:%1', _objectID] call ExileServer_system_database_query_fireAndForget;
		};
		// Uncomment below for infiSTAR logging
		//_territoryLog = format ["%1 (%2) ABANDONED THEIR TERRITORY %3 AT %4 %5",_player,_playerUID,_territoryName,mapGridPosition _tFlag,_location];
		//["TERRITORYLOG",_territoryLog] call FNC_A3_CUSTOMLOG;
		_add = 0.1;
		if(_location select 2 < 0) then
		{
			_add = 1;
		};
		_holder = createVehicle ['groundWeaponHolder', _location, [], 0, 'CAN_COLLIDE'];
		_location set[2,(_location select 2) + _add];
		_holder setPosATL _location;
		_holder addItemCargoGlobal ['Exile_Item_Flag',1];
	};
};