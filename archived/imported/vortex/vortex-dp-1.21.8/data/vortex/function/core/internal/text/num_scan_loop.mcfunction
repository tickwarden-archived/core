# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/text/num_scan_loop [INTERNAL] every character except the decimal point must be a digit
execute unless score #tx_i vortex.tmp < #tx_len vortex.tmp run return 1
execute if score #tx_i vortex.tmp = #tx_dotpos vortex.tmp run scoreboard players add #tx_i vortex.tmp 1
execute unless score #tx_i vortex.tmp < #tx_len vortex.tmp run return 1
scoreboard players operation #tx_a vortex.tmp = #tx_i vortex.tmp
scoreboard players operation #tx_b vortex.tmp = #tx_i vortex.tmp
scoreboard players add #tx_b vortex.tmp 1
function vortex:core/internal/text/_cut_ab
data modify storage vortex:text mp set value {}
data modify storage vortex:text mp.c set from storage vortex:text win
data modify storage vortex:text isd set value 0b
function vortex:core/internal/text/_digit_probe with storage vortex:text mp
execute if data storage vortex:text {isd:0b} run return 0
scoreboard players add #tx_i vortex.tmp 1
return run function vortex:core/internal/text/num_scan_loop
