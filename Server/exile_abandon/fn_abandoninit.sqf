0 ExecVM "\exile_abandon\fn_abandonTerritory.sqf";
diag_log "exile_abandon ready";

if !(isNil "ABA") exitWith { false };
ABA = true;
diag_log 'Continuing to load Exile';