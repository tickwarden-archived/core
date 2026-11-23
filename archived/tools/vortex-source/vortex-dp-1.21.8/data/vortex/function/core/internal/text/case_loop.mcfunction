# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/text/case_loop [INTERNAL] one character per call
scoreboard players operation #tx_a vortex.tmp = #tx_i vortex.tmp
scoreboard players operation #tx_b vortex.tmp = #tx_i vortex.tmp
scoreboard players add #tx_b vortex.tmp 1
function vortex:core/internal/text/_cut_ab
data modify storage vortex:text mp set value {}
data modify storage vortex:text mp.t set from storage vortex:text tbl
data modify storage vortex:text mp.c set from storage vortex:text win
data modify storage vortex:text ch set from storage vortex:text win
function vortex:core/internal/text/_case_map with storage vortex:text mp
data modify storage vortex:text pc append from storage vortex:text ch
scoreboard players add #tx_i vortex.tmp 1
execute if score #tx_i vortex.tmp < #tx_len vortex.tmp run function vortex:core/internal/text/case_loop
