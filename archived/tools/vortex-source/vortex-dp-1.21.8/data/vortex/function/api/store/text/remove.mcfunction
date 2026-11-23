# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/store/text/remove
# Removes one language of a template. INPUT vortex:store in.name, in.lang. RETURN 1 / 0.
execute if data storage vortex:engine modules{store:0b} run return 0
data remove storage vortex:store tmp
execute unless function vortex:core/internal/api/store/_name run return 0
execute unless function vortex:core/internal/api/store/_lang run return 0
return run function vortex:core/internal/api/store/_t_remove with storage vortex:store tmp.k
