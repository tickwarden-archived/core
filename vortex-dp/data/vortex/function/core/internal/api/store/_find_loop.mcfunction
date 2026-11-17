# vortex:core/internal/api/store/_find_loop [INTERNAL]
# Tries the candidate languages in order. Every candidate is validated first, because
# stored language values are data a player or pack may have written.
execute unless data storage vortex:store tmp.langs[0] run return 0
data modify storage vortex:store tmp.k.lang set from storage vortex:store tmp.langs[0]
data remove storage vortex:validate in
data modify storage vortex:validate in.value set from storage vortex:store tmp.k.lang
execute if function vortex:systems/validate/safe_name run function vortex:core/internal/api/store/_t_try with storage vortex:store tmp.k
execute if data storage vortex:store tmp.tpl run return 1
data remove storage vortex:store tmp.langs[0]
function vortex:core/internal/api/store/_find_loop
