# Exile_Abandon_Territory
Server mod for Arma 3 Exile

Instructions

Server

Drop the exile_abandon.pbo into your @ExileServer\addons\ folder

Client

In your mission file config.cpp, in the section class Flag add the following into the block 

class AbandonTerritory: ExileAbstractAction
{
  title = "Abandon Territory";
  condition = "((typeOf ExileClientInteractionObject) isEqualTo 'Exile_Construction_Flag_Static' && (call ExileClient_util_world_isInOwnTerritory) && ((ExileClientInteractionObject getvariable ['ExileFlagStolen',1]) isEqualTo 0))";
  action = "execVM 'abandon.sqf';";
};

Add the abandon.sqf into your mission root or custom content folder, if you have it in a custom location don't forget to edit the above

Battleye

Append your Battleye filters with the whitelistings in the Battleye folder