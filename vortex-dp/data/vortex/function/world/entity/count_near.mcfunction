# ======================================================================================
# vortex:world/entity/count_near
# Counts entities of one type within a radius of the executor's position.
#
# INPUT  (storage vortex:input world):
#   type    namespaced entity type, e.g. "minecraft:zombie" (tags are not accepted)
#   radius  blocks, clamped to 1..1024. Must be a real NBT number (not a string).
# OUTPUT vortex:output count (int)
# RETURN the count (0 for invalid input).
#
# type is checked with systems/validate/function_id (namespace:path shape, every piece
# through safe_name) before it reaches the selector. The executor itself is counted when
# it matches the type.
#
# Usage:
#   data modify storage vortex:input world set value {type:"minecraft:zombie",radius:32}
#   execute as @a[limit=1] at @s run function vortex:world/entity/count_near
# ======================================================================================

data modify storage vortex:output count set value 0
execute unless data storage vortex:input world.type run return 0
execute unless data storage vortex:input world.radius run return 0
data remove storage vortex:validate in
data modify storage vortex:validate in.value set from storage vortex:input world.type
execute unless function vortex:systems/validate/function_id run return 0

execute store result score #ext_wn_r vortex.tmp run data get storage vortex:input world.radius
execute if score #ext_wn_r vortex.tmp matches ..0 run scoreboard players set #ext_wn_r vortex.tmp 1
execute if score #ext_wn_r vortex.tmp matches 1025.. run scoreboard players set #ext_wn_r vortex.tmp 1024
data modify storage vortex:engine _ext_wn set value {}
data modify storage vortex:engine _ext_wn.type set from storage vortex:input world.type
execute store result storage vortex:engine _ext_wn.r int 1 run scoreboard players get #ext_wn_r vortex.tmp
function vortex:core/internal/ext/world/count_near with storage vortex:engine _ext_wn
data remove storage vortex:engine _ext_wn
return run data get storage vortex:output count
