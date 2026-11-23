# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/text/split_emit [INTERNAL] appends win to out unless it is empty and empties are dropped
execute store result score #tx_wl vortex.tmp run data get storage vortex:text win
execute if score #tx_wl vortex.tmp matches 1.. run data modify storage vortex:text out append from storage vortex:text win
execute if score #tx_wl vortex.tmp matches 0 if score #tx_keep vortex.tmp matches 1 run data modify storage vortex:text out append from storage vortex:text win
