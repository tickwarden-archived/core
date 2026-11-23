# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/store/player/add
# per-player value of the executor (@s must be a player)
#
# INPUT  vortex:store in.name, in.by (int, default 1; negative subtracts)
# OUTPUT vortex:store out.value = new value. Counters only: do not use on strings.
# RETURN 1 on success, 0 on invalid name / missing input / not a player.
#
# Plain strings in, plain strings out. Nothing here ever builds a text component.
# Names are checked with systems/validate/safe_name while they are still data in storage,
# before they reach a macro line (see api/perm/require for the same pattern).
execute if data storage vortex:engine modules{store:0b} run return 0
data remove storage vortex:store tmp
execute unless function vortex:core/internal/api/store/_name run return 0
execute unless function vortex:core/internal/api/store/_uuid run return 0
execute unless data storage vortex:store in.by run data modify storage vortex:store in.by set value 1
execute store result score #st_by vortex.tmp run data get storage vortex:store in.by
return run function vortex:core/internal/api/store/_p_add with storage vortex:store tmp.k
