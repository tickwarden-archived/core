# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/text/find
# Positions of non-overlapping occurrences of a needle in a string.
# INPUT  vortex:text: s (string), needle (string), n (int, optional)
#          n = 0 all, n > 0 the first n, n < 0 the last |n|
# OUTPUT vortex:text: idx (list of start indices, ascending)
# RETURN number of occurrences in idx. An empty needle matches nothing.
execute unless data storage vortex:text n run data modify storage vortex:text n set value 0
data modify storage vortex:text idx set value []
scoreboard players set #tx_hits vortex.tmp 0
execute store result score #tx_len vortex.tmp run data get storage vortex:text s
execute store result score #tx_nlen vortex.tmp run data get storage vortex:text needle
execute store result score #tx_max vortex.tmp run data get storage vortex:text n
execute if score #tx_nlen vortex.tmp matches 0 run return 0
scoreboard players operation #tx_last vortex.tmp = #tx_len vortex.tmp
scoreboard players operation #tx_last vortex.tmp -= #tx_nlen vortex.tmp
execute if score #tx_last vortex.tmp matches ..-1 run return 0
scoreboard players set #tx_cap vortex.tmp 0
execute if score #tx_max vortex.tmp matches 1.. run scoreboard players operation #tx_cap vortex.tmp = #tx_max vortex.tmp
scoreboard players set #tx_i vortex.tmp 0
function vortex:core/internal/text/find_loop
execute if score #tx_max vortex.tmp matches ..-1 run function vortex:core/internal/text/find_trim
return run scoreboard players get #tx_hits vortex.tmp
