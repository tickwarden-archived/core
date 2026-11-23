# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:player/reset [MACRO]
$data remove storage macroengine:engine players.$(player)
$data remove storage macroengine:engine cooldowns.$(player)
$advancement revoke @a[name=$(player),limit=1] from macroengine:hidden/root
$data modify storage macroengine:engine _pid_init_tmp set value {player:"$(player)"}
function macroengine:player/init with storage macroengine:engine _pid_init_tmp
