# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/text/find_trim [INTERNAL] keep only the last |n| matches
scoreboard players set #tx_m1 vortex.tmp -1
scoreboard players operation #tx_drop vortex.tmp = #tx_max vortex.tmp
scoreboard players operation #tx_drop vortex.tmp *= #tx_m1 vortex.tmp
scoreboard players operation #tx_drop vortex.tmp -= #tx_hits vortex.tmp
scoreboard players operation #tx_drop vortex.tmp *= #tx_m1 vortex.tmp
execute if score #tx_drop vortex.tmp matches 1.. run function vortex:core/internal/text/find_drop
