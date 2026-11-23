# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/store/_g_set [MACRO] [INTERNAL]
$data modify storage vortex:store g.$(name) set from storage vortex:store in.value
return 1
