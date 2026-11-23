# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/text/replace_loop [INTERNAL] emits "text before match" + replacement per match
execute unless data storage vortex:text idx[0] run return 0
execute store result score #tx_k vortex.tmp run data get storage vortex:text idx[0]
scoreboard players operation #tx_a vortex.tmp = #tx_pos vortex.tmp
scoreboard players operation #tx_b vortex.tmp = #tx_k vortex.tmp
function vortex:core/internal/text/_cut_ab
data modify storage vortex:text pc append from storage vortex:text win
data modify storage vortex:text pc append from storage vortex:text r.rep
scoreboard players operation #tx_pos vortex.tmp = #tx_k vortex.tmp
scoreboard players operation #tx_pos vortex.tmp += #tx_nlen vortex.tmp
data remove storage vortex:text idx[0]
function vortex:core/internal/text/replace_loop
