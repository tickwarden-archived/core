# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/string/repeat
# Repeats a single character (char) exactly `count` times (1–16).
# Params: char (single character), count (integer 1–16)
# Output: vortex:output result = repeated string
# Note: count is clamped to 1–16. Larger repeats should be assembled by the caller.
#
# Implementation: static dispatch to internal/repeat_N which sets the literal string.
# Each internal file uses a single $data modify line with N $(char) expansions.

execute if data storage vortex:engine modules{string:0b} run return 0
data modify storage vortex:output result set value ""

$data modify storage vortex:engine _repeat_args.char set value "$(char)"
$scoreboard players set $sr_n vortex.tmp $(count)
execute if score $sr_n vortex.tmp matches ..0 run scoreboard players set $sr_n vortex.tmp 1
execute if score $sr_n vortex.tmp matches 17.. run scoreboard players set $sr_n vortex.tmp 16

execute if score $sr_n vortex.tmp matches 1 run function vortex:core/internal/systems/string/repeat_1 with storage vortex:engine _repeat_args
execute if score $sr_n vortex.tmp matches 2 run function vortex:core/internal/systems/string/repeat_2 with storage vortex:engine _repeat_args
execute if score $sr_n vortex.tmp matches 3 run function vortex:core/internal/systems/string/repeat_3 with storage vortex:engine _repeat_args
execute if score $sr_n vortex.tmp matches 4 run function vortex:core/internal/systems/string/repeat_4 with storage vortex:engine _repeat_args
execute if score $sr_n vortex.tmp matches 5 run function vortex:core/internal/systems/string/repeat_5 with storage vortex:engine _repeat_args
execute if score $sr_n vortex.tmp matches 6 run function vortex:core/internal/systems/string/repeat_6 with storage vortex:engine _repeat_args
execute if score $sr_n vortex.tmp matches 7 run function vortex:core/internal/systems/string/repeat_7 with storage vortex:engine _repeat_args
execute if score $sr_n vortex.tmp matches 8 run function vortex:core/internal/systems/string/repeat_8 with storage vortex:engine _repeat_args
execute if score $sr_n vortex.tmp matches 9 run function vortex:core/internal/systems/string/repeat_9 with storage vortex:engine _repeat_args
execute if score $sr_n vortex.tmp matches 10 run function vortex:core/internal/systems/string/repeat_10 with storage vortex:engine _repeat_args
execute if score $sr_n vortex.tmp matches 11 run function vortex:core/internal/systems/string/repeat_11 with storage vortex:engine _repeat_args
execute if score $sr_n vortex.tmp matches 12 run function vortex:core/internal/systems/string/repeat_12 with storage vortex:engine _repeat_args
execute if score $sr_n vortex.tmp matches 13 run function vortex:core/internal/systems/string/repeat_13 with storage vortex:engine _repeat_args
execute if score $sr_n vortex.tmp matches 14 run function vortex:core/internal/systems/string/repeat_14 with storage vortex:engine _repeat_args
execute if score $sr_n vortex.tmp matches 15 run function vortex:core/internal/systems/string/repeat_15 with storage vortex:engine _repeat_args
execute if score $sr_n vortex.tmp matches 16 run function vortex:core/internal/systems/string/repeat_16 with storage vortex:engine _repeat_args
data remove storage vortex:engine _repeat_args
