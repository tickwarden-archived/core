# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/string/ordinal
# Determines the English ordinal suffix for a positive integer.
# Handles the 11th/12th/13th exception correctly.
#
#  Input : $(n) → positive integer (1-based)
# Output: vortex:output n → original value (int)
# vortex:output suffix → "st" / "nd" / "rd" / "th"
#
# To display "3rd place" in chat:
# function vortex:systems/string/ordinal {n:3}
# tellraw @a ["",
# {"plain":true ,"storage":"vortex:output","nbt":"n"},
# {"plain":true ,"storage":"vortex:output","nbt":"suffix","color":"gold"},
# {"text":" place"}]
#
# Examples:
# {n:1} → suffix="st" {n:11} → suffix="th"
# {n:2} → suffix="nd" {n:12} → suffix="th"
# {n:3} → suffix="rd" {n:13} → suffix="th"
# {n:4} → suffix="th" {n:21} → suffix="st"
# {n:22} → suffix="nd" {n:103}→ suffix="rd"
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{string:0b} run return 0
$scoreboard players set $ord_n vortex.tmp $(n)
execute store result storage vortex:output n int 1 run scoreboard players get $ord_n vortex.tmp

# last-two-digits mod 100 (teen detection)
scoreboard players operation $ord_h vortex.tmp = $ord_n vortex.tmp
scoreboard players set $ord_100 vortex.tmp 100
scoreboard players operation $ord_h vortex.tmp %= $ord_100 vortex.tmp

# last digit mod 10 (suffix selection)
scoreboard players operation $ord_d vortex.tmp = $ord_n vortex.tmp
scoreboard players set $ord_10 vortex.tmp 10
scoreboard players operation $ord_d vortex.tmp %= $ord_10 vortex.tmp

# Default: th
data modify storage vortex:output suffix set value "th"

# Apply last-digit rules
execute if score $ord_d vortex.tmp matches 1 run data modify storage vortex:output suffix set value "st"
execute if score $ord_d vortex.tmp matches 2 run data modify storage vortex:output suffix set value "nd"
execute if score $ord_d vortex.tmp matches 3 run data modify storage vortex:output suffix set value "rd"

# Teen override — 11, 12, 13 must always be "th"
execute if score $ord_h vortex.tmp matches 11..13 run data modify storage vortex:output suffix set value "th"
