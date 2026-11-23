# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/store/_p_default [MACRO] [INTERNAL]
$execute if data storage vortex:store p."$(a)_$(b)_$(c)_$(d)".$(name) run return 0
$data modify storage vortex:store p."$(a)_$(b)_$(c)_$(d)".$(name) set from storage vortex:store in.value
return 1
