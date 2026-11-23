# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/text/split_emit [INTERNAL] appends win to out unless it is empty and empties are dropped
execute store result score #tx_wl macroengine.tmp run data get storage macroengine:text win
execute if score #tx_wl macroengine.tmp matches 1.. run data modify storage macroengine:text out append from storage macroengine:text win
execute if score #tx_wl macroengine.tmp matches 0 if score #tx_keep macroengine.tmp matches 1 run data modify storage macroengine:text out append from storage macroengine:text win
