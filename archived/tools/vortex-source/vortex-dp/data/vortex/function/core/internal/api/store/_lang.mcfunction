# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/store/_lang [INTERNAL]
# Validates vortex:store in.lang and copies it to tmp.k.lang. RETURN 1 valid, 0 invalid.
data remove storage vortex:validate in
data modify storage vortex:validate in.value set from storage vortex:store in.lang
execute unless function vortex:systems/validate/safe_name run return 0
data modify storage vortex:store tmp.k.lang set from storage vortex:store in.lang
return 1
