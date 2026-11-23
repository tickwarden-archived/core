# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/hook/on_break_block
# Reward: break_block advancement (item_durability_changed, delta max -1)
# Feeds both break_block and using_item hooks.
execute if data storage vortex:engine modules{hook:0b} run return 0
advancement revoke @s only vortex:systems/hook/break_block
scoreboard players add @s vortex.hook_tool_used 1
scoreboard players add @s vortex.hook_using_item 1
