# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/api/store/_tok_p [INTERNAL]  token %p:name%
execute unless entity @s[type=player] run return 0
data modify storage macroengine:store tmp.rest set string storage macroengine:store tmp.nm 2
data remove storage macroengine:validate in
data modify storage macroengine:validate in.value set from storage macroengine:store tmp.rest
execute unless function macroengine:systems/validate/safe_name run return 0
data modify storage macroengine:store tmp.k set value {}
data modify storage macroengine:store tmp.k.name set from storage macroengine:store tmp.rest
function macroengine:core/internal/api/store/_uuid
function macroengine:core/internal/api/store/_tok_p_get with storage macroengine:store tmp.k
execute if data storage macroengine:store tmp.raw run function macroengine:core/internal/api/store/_accept
