# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_402f6da28f:lifecycle {phase:1} run return 0
#> left_click_detection:core/load
#
# load時に実行される
#
# @within tag/function minecraft:load

#> team設定
# @within left_click_detection:**
team add LeftClickDetection
team modify LeftClickDetection collisionRule never
