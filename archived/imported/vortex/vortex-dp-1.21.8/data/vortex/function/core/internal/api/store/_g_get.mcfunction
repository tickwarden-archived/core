# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/store/_g_get [MACRO] [INTERNAL]
$execute unless data storage vortex:store g.$(name) run return 0
$data modify storage vortex:store out.value set from storage vortex:store g.$(name)
return 1
