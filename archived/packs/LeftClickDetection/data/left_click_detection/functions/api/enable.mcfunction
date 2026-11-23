# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_402f6da28f:lifecycle {phase:1} run return 0
#> left_click_detection:api/enable
#
# 実行者の左クリック検知を有効化します
#
# @api

function left_click_detection:core/detail/enable
