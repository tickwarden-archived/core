# vortex:api/store/render_all
# Renders the same template once for every online player (each render runs as that player, so
# %player%, %p:name% and %score:obj% resolve per recipient) and collects plain strings.
#
# INPUT  same as api/store/render (in.template or in.name, in.lang, in.args)
# OUTPUT vortex:store all.entries  list of {uuid:[I;...],string:"..."}, one per player whose
#                                       render succeeded
# RETURN number of entries
#
# Usage:
#   data modify storage vortex:store in set value {template:"Hi %player%, coins: %score:coins%"}
#   function vortex:api/store/render_all
execute if data storage vortex:engine modules{store:0b} run return 0
data remove storage vortex:store all
data modify storage vortex:store all.entries set value []
execute as @a run function vortex:core/internal/api/store/_all_one
return run data get storage vortex:store all.entries
