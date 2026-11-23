# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/api/perm/trigger/tick_dispatch [MACRO]
$execute as @a[scores={$(name)=1..}] run function macroengine:core/internal/api/perm/trigger/player_dispatch with storage macroengine:engine _pt_tick_ctx

$execute as @a run scoreboard players enable @s $(name)
