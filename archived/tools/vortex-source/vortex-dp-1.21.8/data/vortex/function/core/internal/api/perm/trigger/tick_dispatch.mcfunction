# vortex:core/internal/api/perm/trigger/tick_dispatch [MACRO]
$execute as @a[scores={$(name)=1..}] run function vortex:core/internal/api/perm/trigger/player_dispatch with storage vortex:engine _pt_tick_ctx

$execute as @a run scoreboard players enable @s $(name)
