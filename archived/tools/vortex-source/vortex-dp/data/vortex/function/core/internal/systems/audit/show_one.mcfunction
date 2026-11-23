# vortex:core/internal/systems/audit/show_one  [INTERNAL — macro function]
# $(i) is an int written by show_loop from a scoreboard value, never player input.
$tellraw @s [{"text":"#$(i) ","color":"dark_gray"},{"storage":"vortex:audit","nbt":"entries[$(i)]","interpret":false,"color":"yellow","plain":true}]
