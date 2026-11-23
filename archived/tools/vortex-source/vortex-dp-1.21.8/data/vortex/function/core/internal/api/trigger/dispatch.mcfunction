# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/trigger/dispatch
scoreboard players operation $tc_player vortex.tmp = @s vortex.action

scoreboard players set @s vortex.action 0
scoreboard players enable @s vortex.action

execute unless data storage vortex:engine trigger_binds[0] run return 0

data modify storage vortex:engine _tc_binds set from storage vortex:engine trigger_binds

function vortex:core/internal/api/trigger/check_next
data remove storage vortex:engine _tc_binds
data remove storage vortex:engine _tc_current
