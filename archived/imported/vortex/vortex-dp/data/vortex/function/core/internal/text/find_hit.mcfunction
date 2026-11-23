# vortex:core/internal/text/find_hit [INTERNAL] record a match at #tx_i and skip past it
data modify storage vortex:text idx append value 0
execute store result storage vortex:text idx[-1] int 1 run scoreboard players get #tx_i vortex.tmp
scoreboard players add #tx_hits vortex.tmp 1
scoreboard players operation #tx_i vortex.tmp += #tx_nlen vortex.tmp
