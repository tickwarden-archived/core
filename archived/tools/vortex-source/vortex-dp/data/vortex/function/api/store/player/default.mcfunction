# vortex:api/store/player/default
# per-player value of the executor (@s must be a player)
#
# INPUT  vortex:store in.name, in.value
# OUTPUT none (only writes when the name is not set yet)
# RETURN 1 on success, 0 on invalid name / missing input / not a player.
#
# Plain strings in, plain strings out. Nothing here ever builds a text component.
# Names are checked with systems/validate/safe_name while they are still data in storage,
# before they reach a macro line (see api/perm/require for the same pattern).
execute if data storage vortex:engine modules{store:0b} run return 0
data remove storage vortex:store tmp
execute unless data storage vortex:store in.value run return 0
execute unless function vortex:core/internal/api/store/_name run return 0
execute unless function vortex:core/internal/api/store/_uuid run return 0
return run function vortex:core/internal/api/store/_p_default with storage vortex:store tmp.k
