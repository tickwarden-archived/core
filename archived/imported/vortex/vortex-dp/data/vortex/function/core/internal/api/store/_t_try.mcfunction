# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/store/_t_try [MACRO] [INTERNAL]
$execute if data storage vortex:store tpl.$(name).$(lang) run data modify storage vortex:store tmp.tpl set from storage vortex:store tpl.$(name).$(lang)
