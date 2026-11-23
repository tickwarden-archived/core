# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/store/nbt/toggle [MACRO]
# Flips the byte flag at storage/path (missing counts as 0b -> becomes 1b).
# Input (macro args): storage, path.  RETURN the new value (0 or 1).
execute if data storage vortex:engine modules{store:0b} run return 0
scoreboard players set #da_v vortex.tmp 0
$execute store result score #da_v vortex.tmp run data get storage $(storage) $(path)
execute store success score #da_v vortex.tmp if score #da_v vortex.tmp matches 0
$execute store result storage $(storage) $(path) byte 1 run scoreboard players get #da_v vortex.tmp
return run scoreboard players get #da_v vortex.tmp
