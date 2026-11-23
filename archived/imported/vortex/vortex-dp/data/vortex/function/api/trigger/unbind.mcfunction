# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/trigger/unbind [MACRO]
execute if data storage vortex:engine modules{trigger:0b} run return 0
execute unless data storage vortex:engine trigger_binds run return 0

data modify storage vortex:engine _tc_unbind set from storage vortex:engine trigger_binds
data modify storage vortex:engine trigger_binds set value []

$data modify storage vortex:engine _tc_uval set value $(value)
function vortex:core/internal/api/trigger/unbind_filter
data remove storage vortex:engine _tc_unbind
data remove storage vortex:engine _tc_uval
