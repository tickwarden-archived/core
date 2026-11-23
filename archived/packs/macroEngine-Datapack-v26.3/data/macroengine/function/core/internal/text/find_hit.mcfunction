# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/text/find_hit [INTERNAL] record a match at #tx_i and skip past it
data modify storage macroengine:text idx append value 0
execute store result storage macroengine:text idx[-1] int 1 run scoreboard players get #tx_i macroengine.tmp
scoreboard players add #tx_hits macroengine.tmp 1
scoreboard players operation #tx_i macroengine.tmp += #tx_nlen macroengine.tmp
