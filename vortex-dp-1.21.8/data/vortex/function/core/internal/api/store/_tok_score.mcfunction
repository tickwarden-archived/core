# vortex:core/internal/api/store/_tok_score [INTERNAL]  token %score:objective%
# Writes the executor's score as a plain string into tmp.val. tmp.val stays unset when the
# objective name is invalid, the objective does not exist or the executor has no score.
data modify storage vortex:store tmp.rest set string storage vortex:store tmp.nm 6
data remove storage vortex:validate in
data modify storage vortex:validate in.value set from storage vortex:store tmp.rest
execute unless function vortex:systems/validate/safe_name run return 0
data modify storage vortex:store tmp.k set value {}
data modify storage vortex:store tmp.k.obj set from storage vortex:store tmp.rest
data remove storage vortex:store tmp.num
function vortex:core/internal/api/store/_tok_score_build with storage vortex:store tmp.k
execute if data storage vortex:store tmp.num run data modify storage vortex:store tmp.val set string storage vortex:store tmp.num
data remove storage vortex:store tmp.num
