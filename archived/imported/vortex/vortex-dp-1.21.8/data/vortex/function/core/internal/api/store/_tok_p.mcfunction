# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/store/_tok_p [INTERNAL]  token %p:name%
execute unless entity @s[type=player] run return 0
data modify storage vortex:store tmp.rest set string storage vortex:store tmp.nm 2
data remove storage vortex:validate in
data modify storage vortex:validate in.value set from storage vortex:store tmp.rest
execute unless function vortex:systems/validate/safe_name run return 0
data modify storage vortex:store tmp.k set value {}
data modify storage vortex:store tmp.k.name set from storage vortex:store tmp.rest
function vortex:core/internal/api/store/_uuid
function vortex:core/internal/api/store/_tok_p_get with storage vortex:store tmp.k
execute if data storage vortex:store tmp.raw run function vortex:core/internal/api/store/_accept
