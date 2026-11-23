# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:api/wand/internal/dispatch
# Called as @s. Compare held items with the bind list.

data modify storage macroengine:engine _wand_iter set from storage macroengine:engine wand_binds
execute if data storage macroengine:engine _wand_iter[0] run function macroengine:core/internal/api/wand/check_next
data remove storage macroengine:engine _wand_iter
data remove storage macroengine:engine _wand_current
