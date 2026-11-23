# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_402f6da28f:lifecycle {phase:1} run return 0
#> left_click_detection:core/handler
#
# 左クリック時に呼び出される
#
# @within function left_click_detection:core/tick/_

# コールバック
execute at @s run function #left_click_detection:callback

# リセット
advancement revoke @s only left_click_detection:handler
