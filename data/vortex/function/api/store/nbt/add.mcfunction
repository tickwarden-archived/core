# vortex:api/store/nbt/add [MACRO]
# Adds `by` (negative to subtract) to the integer at storage/path; a missing path counts as 0.
# Input (macro args): storage, path, by.  RETURN the new value.
#
# Usage:  function vortex:api/store/nbt/add {storage:"mypack:data",path:"stats.kills",by:1}
execute if data storage vortex:engine modules{store:0b} run return 0
scoreboard players set #da_v vortex.tmp 0
$execute store result score #da_v vortex.tmp run data get storage $(storage) $(path)
$scoreboard players add #da_v vortex.tmp $(by)
$execute store result storage $(storage) $(path) int 1 run scoreboard players get #da_v vortex.tmp
return run scoreboard players get #da_v vortex.tmp
