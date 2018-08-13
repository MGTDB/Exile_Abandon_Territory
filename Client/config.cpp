class Flag
	{
		targetType = 2;
		target = "Exile_Construction_Flag_Static";
		class Actions
		{			
			class AbandonTerritory: ExileAbstractAction
			{
			  title = "Abandon Territory";
			  condition = "((typeOf ExileClientInteractionObject) isEqualTo 'Exile_Construction_Flag_Static' && (call ExileClient_util_world_isInOwnTerritory))";
			  action = "execVM 'abandon.sqf';";
			};
		};
	};