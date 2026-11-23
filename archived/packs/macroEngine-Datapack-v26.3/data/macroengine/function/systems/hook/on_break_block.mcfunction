# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:systems/hook/on_break_block
# Reward: break_block advancement (item_durability_changed, delta max -1)
# Feeds both break_block and using_item hooks.
execute if data storage macroengine:engine modules{hook:0b} run return 0
advancement revoke @s only macroengine:systems/hook/break_block
scoreboard players add @s macroengine.hook_tool_used 1
scoreboard players add @s macroengine.hook_using_item 1
