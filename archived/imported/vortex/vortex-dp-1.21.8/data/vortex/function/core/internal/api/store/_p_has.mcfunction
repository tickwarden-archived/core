# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/store/_p_has [MACRO] [INTERNAL]
$return run execute if data storage vortex:store p."$(a)_$(b)_$(c)_$(d)".$(name)
