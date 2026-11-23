# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/store/_plang_get [MACRO] [INTERNAL]
$execute if data storage vortex:store p."$(a)_$(b)_$(c)_$(d)".lang run data modify storage vortex:store tmp.langs append from storage vortex:store p."$(a)_$(b)_$(c)_$(d)".lang
