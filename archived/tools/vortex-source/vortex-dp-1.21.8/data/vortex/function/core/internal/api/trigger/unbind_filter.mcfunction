# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/trigger/unbind_filter
execute unless data storage vortex:engine _tc_unbind[0] run return 0

execute store result score $tc_fval vortex.tmp run data get storage vortex:engine _tc_unbind[0].value

execute store result score $tc_uval vortex.tmp run data get storage vortex:engine _tc_uval

execute unless score $tc_fval vortex.tmp = $tc_uval vortex.tmp run data modify storage vortex:engine trigger_binds append from storage vortex:engine _tc_unbind[0]

data remove storage vortex:engine _tc_unbind[0]
function vortex:core/internal/api/trigger/unbind_filter
