# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/text/find_loop [INTERNAL] one window comparison per call
scoreboard players operation #tx_a vortex.tmp = #tx_i vortex.tmp
scoreboard players operation #tx_b vortex.tmp = #tx_i vortex.tmp
scoreboard players operation #tx_b vortex.tmp += #tx_nlen vortex.tmp
function vortex:core/internal/text/_cut_ab
data modify storage vortex:text cmp set from storage vortex:text win
execute store success score #tx_diff vortex.tmp run data modify storage vortex:text cmp set from storage vortex:text needle
execute if score #tx_diff vortex.tmp matches 0 run function vortex:core/internal/text/find_hit
execute if score #tx_diff vortex.tmp matches 1 run scoreboard players add #tx_i vortex.tmp 1
execute if score #tx_cap vortex.tmp matches 1.. if score #tx_hits vortex.tmp >= #tx_cap vortex.tmp run return 0
execute if score #tx_i vortex.tmp <= #tx_last vortex.tmp run function vortex:core/internal/text/find_loop
