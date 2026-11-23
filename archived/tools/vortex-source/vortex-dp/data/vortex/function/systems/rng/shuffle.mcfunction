# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ======================================================================================
# vortex:systems/rng/shuffle
# Shuffles a list with the seeded generator (Fisher-Yates), so a shuffle can be replayed
# with systems/rng/seed exactly like every other systems/rng function.
#
# INPUT  (storage vortex:input shuffle):  list   any NBT list
# OUTPUT vortex:output result: a shuffled COPY; the input list is not modified
# RETURN the number of elements shuffled.
#        0 (and output.result untouched) for an empty list, a value that is not a list,
#        or a list longer than 500 elements (one tick has a command budget).
#
# The list is read from storage and never pasted into a command, unlike systems/rng/pick.
#
# Usage:
#   data modify storage vortex:input shuffle.list set value ["a","b","c","d"]
#   function vortex:systems/rng/shuffle
# ======================================================================================

execute if data storage vortex:engine modules{rng:0b} run return 0
data remove storage vortex:output result
execute unless data storage vortex:input shuffle.list[0] run return 0

data modify storage vortex:engine _ext_shf set from storage vortex:input shuffle.list
execute store result score #ext_shf_n vortex.tmp run data get storage vortex:engine _ext_shf
execute if score #ext_shf_n vortex.tmp matches 501.. run data remove storage vortex:engine _ext_shf
execute if score #ext_shf_n vortex.tmp matches 501.. run return 0

scoreboard players operation #ext_shf_i vortex.tmp = #ext_shf_n vortex.tmp
scoreboard players remove #ext_shf_i vortex.tmp 1
execute if score #ext_shf_i vortex.tmp matches 1.. run function vortex:core/internal/ext/rng/shuffle_step

data modify storage vortex:output result set from storage vortex:engine _ext_shf
data remove storage vortex:engine _ext_shf
data remove storage vortex:engine _ext_shf_arg
data remove storage vortex:engine _ext_shf_t
return run scoreboard players get #ext_shf_n vortex.tmp
