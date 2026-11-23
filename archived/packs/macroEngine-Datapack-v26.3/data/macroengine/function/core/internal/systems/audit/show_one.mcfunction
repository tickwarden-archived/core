# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/systems/audit/show_one  [INTERNAL — macro function]
# $(i) is an int written by show_loop from a scoreboard value, never player input.
$tellraw @s [{"text":"#$(i) ","color":"dark_gray"},{"storage":"macroengine:audit","nbt":"entries[$(i)]","interpret":false,"color":"yellow","plain":true}]
