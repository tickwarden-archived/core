# vortex:core/internal/api/perm/trigger/player_dispatch [MACRO]
$scoreboard players operation $ptd_val vortex.tmp = @s $(name)

$scoreboard players set @s $(name) 0
$scoreboard players enable @s $(name)

$execute unless data storage vortex:engine perm_triggers.$(name)[0] run return 0

$data modify storage vortex:engine _ptd_binds set from storage vortex:engine perm_triggers.$(name)

function vortex:core/internal/api/perm/trigger/check_bind
data remove storage vortex:engine _ptd_binds
data remove storage vortex:engine _ptd_current
