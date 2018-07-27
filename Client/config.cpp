class Flag
	{
		targetType = 2;
		target = "Exile_Construction_Flag_Static";
		class Actions
		{			
			class AbandonTerritory: ExileAbstractAction
			{
			  title = "Abandon Territory";
			  condition = "((typeOf ExileClientInteractionObject) isEqualTo 'Exile_Construction_Flag_Static' && (call ExileClient_util_world_isInOwnTerritory) && ((ExileClientInteractionObject getvariable ['ExileFlagStolen',1]) isEqualTo 0))";
			  action = "execVM 'abandon.sqf';";
			};
		};
	};