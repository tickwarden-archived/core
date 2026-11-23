# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/player/click_detection/tick
execute store result score #temp vortex.player_action.data if items entity @s weapon.mainhand *[minecraft:custom_data~{vortex_player:{click_detection:1b}}]

execute if score #temp vortex.player_action.data matches 0 if entity @s[tag=vortex.player_action.click_detection] run function vortex:core/internal/player/click_detection/end
execute if score #temp vortex.player_action.data matches 1 run function vortex:core/internal/player/click_detection/process
