# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/player/click_detection/start
tag @s add vortex.player_action.click_detection
summon minecraft:interaction ~ ~ ~ {Tags:["vortex.player_action.click_entity","vortex.player_action.new","smithed.entity","smithed.strict"]}
execute as @e[type=minecraft:interaction,tag=vortex.player_action.new] at @s run function vortex:core/internal/player/click_detection/start_2
