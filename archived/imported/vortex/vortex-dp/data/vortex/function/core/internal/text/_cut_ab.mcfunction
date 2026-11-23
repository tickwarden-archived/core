# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/text/_cut_ab
# win = substring [#tx_a, #tx_b) of storage vortex:text s. An empty range yields "" directly.
execute if score #tx_a vortex.tmp = #tx_b vortex.tmp run data modify storage vortex:text win set value ""
execute if score #tx_a vortex.tmp = #tx_b vortex.tmp run return 1
execute store result storage vortex:text arg.a int 1 run scoreboard players get #tx_a vortex.tmp
execute store result storage vortex:text arg.b int 1 run scoreboard players get #tx_b vortex.tmp
function vortex:core/internal/text/_cut with storage vortex:text arg
return 1
