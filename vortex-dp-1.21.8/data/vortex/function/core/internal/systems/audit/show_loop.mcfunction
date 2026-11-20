# vortex:core/internal/systems/audit/show_loop  [INTERNAL]
# Prints entry #au_i, then recurses until #au_i reaches #au_n. Depth is at most 10.
execute store result storage vortex:audit idx.i int 1 run scoreboard players get #vortex.au_i vortex.tmp
function vortex:core/internal/systems/audit/show_one with storage vortex:audit idx
scoreboard players add #vortex.au_i vortex.tmp 1
execute if score #vortex.au_i vortex.tmp < #vortex.au_n vortex.tmp run function vortex:core/internal/systems/audit/show_loop
