# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/store/_g_remove [MACRO] [INTERNAL]
$data remove storage vortex:store g.$(name)
return 1
