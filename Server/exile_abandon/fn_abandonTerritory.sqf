if(isServer) then
{
	"abandon" addPublicVariableEventHandler {_this select 1 call abandon_territory};
	abandon_territory =
	{	
		private ["_tFlag","_location","_player","_playerUID","_territoryName","_objectID","_territoryLog","_holder","_level","_crate","_cargoToAdd"];
		_cargoToAdd = [];
		_tFlag = _this select 0;
		_location = _this select 1;
		_player = _this select 2;
		_playerUID = _this select 3;
		_territoryName = _this select 4;
		_level = _this select 5;
		_cargoToAdd = _this select 6;
		_size = _this select 7;
		_objectID = _tFlag getVariable ['ExileDatabaseID',-1];
		if!(_objectID isEqualTo -1)then
		{
			format['deleteTerritory:%1', _objectID] call ExileServer_system_database_query_fireAndForget;
		};

		_crate = "Exile_Container_SupplyBox" createVehicle _location;
		_crate setVariable ["BIS_enableRandomization",false];
		clearWeaponCargoGlobal _crate;
		clearMagazineCargoGlobal _crate;
		clearBackpackCargoGlobal _crate;
		clearItemCargoGlobal _crate;
		
		{
	    		_type = typeOf _x;
			_objectID = _x getVariable ['ExileDatabaseID',-1];
	    		_filter = ('getText(_x >> "staticObject") == _type' configClasses(configfile >> "CfgConstruction")) select 0;
			_kitMagazines = getArray(_filter >> "refundObjects");
			if !((_x getVariable ["ExileAccessCode", -1]) isEqualTo -1) then { _cargoToAdd pushBack "Exile_Item_Codelock"};
			_cargoToAdd append _kitMagazines;
			_x call ExileServer_object_construction_database_delete;
			deleteVehicle _x;
			
		} forEach (_tFlag nearObjects["Exile_Construction_Abstract_Static",_size]);
		
		{
	    		_type = typeOf _x;
	    		_filter = ('getText(_x >> "staticObject") == _type' configClasses(configfile >> "CfgConstruction")) select 0;
			_kitMagazine = getText(_filter >> "kitMagazine");
			_cargoToAdd pushBack _kitMagazine;
			_x call ExileServer_object_construction_database_delete;
			deleteVehicle _x;
		} forEach (_tFlag nearObjects["AbstractConstruction",_size]);
		
		if(_cargoToAdd isEqualTo [])then
		{
			deleteVehicle _crate;
		}
		else
		{
			{_crate addItemCargoGlobal [_x,1];} forEach _cargoToAdd;
		};

		_territoryLog = format ["%1 (%2) ABANDONED THEIR %6 LEVEL TERRITORY %3 AT %4 %5",_player,_playerUID,_territoryName,mapGridPosition _tFlag,_location,_level];
		["TERRITORYLOG",_territoryLog] call FNC_A3_CUSTOMLOG;
	};
};
