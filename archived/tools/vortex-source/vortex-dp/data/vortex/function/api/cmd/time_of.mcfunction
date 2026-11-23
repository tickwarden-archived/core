# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/cmd/time_of
# Usage: /function vortex:api/cmd/time_of {clock:"vortex:test", action:"set", value:"12000"}
# For action:"query", value is a time query argument: "gametime", a timeline
# id such as "day", or "<timeline> repetition" (e.g. "day repetition").
#
# On 26.4 the game has named, per-clock time control (`time of <clock> ...`),
# but `clock` is still ignored here: every call acts on the current
# dimension's clock, so existing call sites keep working unchanged.
# `rate` is refused here rather than silently doing nothing - use
# vortex:api/cmd/set_clock_rate (`time rate <rate>`) for clock speed.
execute if data storage vortex:engine modules{cmd:0b} run return 0
execute if score #perm_cmd vortex.tick_flags matches 1 run data modify storage vortex:perm_require in set value {perm:"cmd.time_of"}
execute if score #perm_cmd vortex.tick_flags matches 1 unless function vortex:api/perm/require run return 0

$data modify storage vortex:engine _time_of_tmp set value {action:"$(action)",value:"$(value)"}

# set/add/query each live in their own macro helper: a single macro function
# holding all three lines can never instantiate, because the substituted
# value is parsed against every line's grammar (a number is not a valid
# `time query` argument and a query name is not a valid `time add` amount).
execute if data storage vortex:engine _time_of_tmp{action:"set"} run function vortex:core/internal/api/cmd/time_of/set with storage vortex:engine _time_of_tmp
execute if data storage vortex:engine _time_of_tmp{action:"add"} run function vortex:core/internal/api/cmd/time_of/add with storage vortex:engine _time_of_tmp
execute if data storage vortex:engine _time_of_tmp{action:"query"} run return run function vortex:core/internal/api/cmd/time_of/query with storage vortex:engine _time_of_tmp
execute if data storage vortex:engine _time_of_tmp{action:"pause"} run gamerule advance_time false
execute if data storage vortex:engine _time_of_tmp{action:"resume"} run gamerule advance_time true
execute if data storage vortex:engine _time_of_tmp{action:"rate"} run tellraw @s [{"text":"[VORTEX] ","color":"red"},{"text":"time_of: 'rate' is not supported here - use vortex:api/cmd/set_clock_rate.","color":"gray"}]

data remove storage vortex:engine _time_of_tmp
