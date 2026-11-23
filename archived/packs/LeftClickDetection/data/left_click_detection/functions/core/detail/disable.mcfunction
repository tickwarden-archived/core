# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_402f6da28f:lifecycle {phase:1} run return 0
#> left_click_detection:core/detail/disable
# @within function left_click_detection:api/disable

# 無効なプレイヤーとしてタグを削除
tag @s remove LCD.Player
