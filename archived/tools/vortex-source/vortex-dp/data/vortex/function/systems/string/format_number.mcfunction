# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/string/format_number
# Converts large numbers to readable abbreviations.
#  Input : $(value) → integer
# Output: vortex:output value → original value
# vortex:output suffix → k / M / B / "" suffix
# vortex:output short → abbreviated integer part (see note below)
#
# NOTE: there is no "text" output — mcfunction alone cannot join a
# number and a string into one storage string. Combine short+suffix
# yourself via tellraw, the same way format_coords/ordinal do:
#   function vortex:systems/string/format_number {value:2500000}
#   tellraw @a ["",
#     {"plain":true ,"storage":"vortex:output","nbt":"short"},
#     {"plain":true ,"storage":"vortex:output","nbt":"suffix","color":"gold"}]
#   → 2500000 → short=25, suffix="M" → displays "25M"
#     (short keeps one implied decimal digit above 999 — divide by 10
#      yourself if you want "2.5M" instead of "25M")
#
# Examples:
# 500 → short=500, suffix=""
# 1500 → short=15, suffix="k"
# 1000000 → short=10, suffix="M"
# 2500000 → short=25, suffix="M"
# 1000000000 → short=10, suffix="B"
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{string:0b} run return 0
$scoreboard players set $fn_v vortex.tmp $(value)
execute store result storage vortex:output value int 1 run scoreboard players get $fn_v vortex.tmp

# < 1000 → plain number
execute if score $fn_v vortex.tmp matches ..999 run data modify storage vortex:output suffix set value ""
execute if score $fn_v vortex.tmp matches ..999 run execute store result storage vortex:output short int 1 run scoreboard players get $fn_v vortex.tmp
execute if score $fn_v vortex.tmp matches ..999 run return 0

# 1000 – 999999 → k
execute if score $fn_v vortex.tmp matches 1000..999999 run data modify storage vortex:output suffix set value "k"
execute if score $fn_v vortex.tmp matches 1000..999999 run scoreboard players set $fn_div vortex.tmp 100
execute if score $fn_v vortex.tmp matches 1000..999999 run scoreboard players operation $fn_v vortex.tmp /= $fn_div vortex.tmp
execute store result storage vortex:output short int 1 run scoreboard players get $fn_v vortex.tmp
execute if score $fn_v vortex.tmp matches 1000..999999 run return 0

# 1_000_000 – 999_999_999 → M
execute if score $fn_v vortex.tmp matches 1000000..999999999 run data modify storage vortex:output suffix set value "M"
execute if score $fn_v vortex.tmp matches 1000000..999999999 run scoreboard players set $fn_div vortex.tmp 100000
execute if score $fn_v vortex.tmp matches 1000000..999999999 run scoreboard players operation $fn_v vortex.tmp /= $fn_div vortex.tmp
execute store result storage vortex:output short int 1 run scoreboard players get $fn_v vortex.tmp
execute if score $fn_v vortex.tmp matches 1000000..999999999 run return 0

# >= 1_000_000_000 → B
execute if score $fn_v vortex.tmp matches 1000000000.. run data modify storage vortex:output suffix set value "B"
execute if score $fn_v vortex.tmp matches 1000000000.. run scoreboard players set $fn_div vortex.tmp 100000000
execute if score $fn_v vortex.tmp matches 1000000000.. run scoreboard players operation $fn_v vortex.tmp /= $fn_div vortex.tmp
execute store result storage vortex:output short int 1 run scoreboard players get $fn_v vortex.tmp
