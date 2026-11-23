# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/load/final
data modify storage macroengine:engine global.version set value "v26.3"
scoreboard players set #vortaforge.packs.macroengine.version macroengine.meta 263
function #macroengine:init
data modify storage macroengine:engine global.loaded set value 1b
tellraw @s [{"text":"[MACROENGINE]","color":"dark_aqua","italic":false}," ",{"text":"Loaded!","italic":false,"color":"green"}]
