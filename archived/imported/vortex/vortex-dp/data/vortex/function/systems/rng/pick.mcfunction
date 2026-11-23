# ─────────────────────────────────────────────────────────────────
# vortex:systems/rng/pick [MACRO]
# Chooses one element uniformly at random from a list.
#
# INPUT:  $(list) — any NBT list
# OUTPUT: vortex:output result — the chosen element
#         vortex:output index  — its position in the input
#
# An empty list leaves output.result untouched and sets index to -1, so
# a caller can tell "nothing to pick" from "picked the first element".
#
# Usage:  function vortex:systems/rng/pick {list:["a","b","c"]}
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{rng:0b} run return 0
$data modify storage vortex:engine _rng_list set value $(list)

execute store result score $rng_len vortex.tmp run data get storage vortex:engine _rng_list

execute if score $rng_len vortex.tmp matches ..0 run data modify storage vortex:output index set value -1
execute if score $rng_len vortex.tmp matches ..0 run data remove storage vortex:engine _rng_list
execute if score $rng_len vortex.tmp matches ..0 run return 0

scoreboard players remove $rng_len vortex.tmp 1

data modify storage vortex:engine _rng_arg set value {min:0}
execute store result storage vortex:engine _rng_arg.max int 1 run scoreboard players get $rng_len vortex.tmp
function vortex:systems/rng/int with storage vortex:engine _rng_arg

execute store result storage vortex:output index int 1 run data get storage vortex:output result
function vortex:core/internal/systems/rng/_pick_at with storage vortex:output

data remove storage vortex:engine _rng_list
data remove storage vortex:engine _rng_arg
scoreboard players reset $rng_len vortex.tmp
