# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/text/split_chars [INTERNAL] one entry per character
scoreboard players operation #tx_a vortex.tmp = #tx_i vortex.tmp
scoreboard players operation #tx_b vortex.tmp = #tx_i vortex.tmp
scoreboard players add #tx_b vortex.tmp 1
function vortex:core/internal/text/_cut_ab
data modify storage vortex:text out append from storage vortex:text win
scoreboard players add #tx_i vortex.tmp 1
execute if score #tx_i vortex.tmp < #tx_len vortex.tmp run function vortex:core/internal/text/split_chars
