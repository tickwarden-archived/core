# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/store/_t_remove [MACRO] [INTERNAL]
$data remove storage vortex:store tpl.$(name).$(lang)
return 1
