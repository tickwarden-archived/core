# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/trigger/check_next
execute unless data storage vortex:engine _tc_binds[0] run return 0

data modify storage vortex:engine _tc_current set from storage vortex:engine _tc_binds[0]
data remove storage vortex:engine _tc_binds[0]

execute store result score $tc_val vortex.tmp run data get storage vortex:engine _tc_current.value

execute if score $tc_player vortex.tmp = $tc_val vortex.tmp if data storage vortex:engine _tc_current.func run function vortex:core/internal/api/trigger/call with storage vortex:engine _tc_current

execute if score $tc_player vortex.tmp = $tc_val vortex.tmp if data storage vortex:engine _tc_current.cmd run function vortex:core/internal/api/trigger/call2 with storage vortex:engine _tc_current

function vortex:core/internal/api/trigger/check_next
