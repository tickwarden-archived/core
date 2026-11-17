# vortex:core/internal/text/find_drop [INTERNAL] pops the oldest match #tx_drop times
data remove storage vortex:text idx[0]
scoreboard players remove #tx_drop vortex.tmp 1
scoreboard players remove #tx_hits vortex.tmp 1
execute if score #tx_drop vortex.tmp matches 1.. run function vortex:core/internal/text/find_drop
