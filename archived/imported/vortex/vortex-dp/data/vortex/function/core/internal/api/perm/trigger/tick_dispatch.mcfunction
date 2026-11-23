# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/perm/trigger/tick_dispatch [MACRO]
$execute as @a[scores={$(name)=1..}] run function vortex:core/internal/api/perm/trigger/player_dispatch with storage vortex:engine _pt_tick_ctx

$execute as @a run scoreboard players enable @s $(name)
