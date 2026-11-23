# ─────────────────────────────────────────────────────────────────
# vortex:world/entity/random
# Selects ONE random entity matching the given type and tag and
# runs the given function as that entity (at its position).
# If no matching entity exists, nothing happens.
#
# Uses /random value (available since 1.20.2) to pick a random
# index, then dispatches via sequential vortex.rnd_idx assignment.
# This gives a true uniform distribution across matching entities.
#
# INPUT : $(type) → entity type (e.g. "minecraft:zombie")
#         $(tag)  → entity tag to match
#         $(func) → function to run as the selected entity
#
# EXAMPLE:
#   function vortex:world/entity/random {type:"minecraft:zombie",tag:"mob.active",func:"mypack:reward"}
# ─────────────────────────────────────────────────────────────────

# Step 1 — count all matching entities
scoreboard players set $rnd_n vortex.tmp 0
$execute as @e[type=$(type),tag=$(tag)] run scoreboard players add $rnd_n vortex.tmp 1

# No entities → nothing to do
execute if score $rnd_n vortex.tmp matches 0 run return 0

# Step 2 — assign sequential vortex.rnd_idx to each matching entity
#           (random_assign runs AS each entity to maintain counter state)
scoreboard players set $rnd_i vortex.tmp 0
$execute as @e[type=$(type),tag=$(tag)] run function vortex:core/internal/world/entity/random_assign

# Step 3 — compute max = count-1, store for the dispatch macro
scoreboard players remove $rnd_n vortex.tmp 1
execute store result storage vortex:engine _rnd.max int 1 run scoreboard players get $rnd_n vortex.tmp
$data modify storage vortex:engine _rnd.func set value "$(func)"
$data modify storage vortex:engine _rnd.type set value "$(type)"
$data modify storage vortex:engine _rnd.tag set value "$(tag)"

# Step 4 — roll /random value 0..max and run func as the winner
function vortex:core/internal/world/entity/random_dispatch with storage vortex:engine _rnd

# Cleanup
data remove storage vortex:engine _rnd
