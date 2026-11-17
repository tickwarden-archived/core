# vortex:api/cmd/time_of
# Usage: /function vortex:api/cmd/time_of {clock:"vortex:test", action:"set", value:"12000"}
#
# Simplified for 1.21.8. The 26.x build this was ported from had named,
# per-clock time control (`time of <clock> ...`); 1.21.8 has one implicit
# clock per dimension and no `time of` command at all. `clock` is still
# accepted so existing callers do not need to change their call sites, but
# it is ignored - every call acts on the current dimension's clock.
# `rate` has no 1.21.8 equivalent (no per-clock speed control exists) and
# is refused rather than silently doing nothing.
execute if data storage vortex:engine modules{cmd:0b} run return 0
execute if score #perm_cmd vortex.tick_flags matches 1 run data modify storage vortex:perm_require in set value {perm:"cmd.time_of"}
execute if score #perm_cmd vortex.tick_flags matches 1 unless function vortex:api/perm/require run return 0

$data modify storage vortex:engine _time_of_tmp set value {action:$(action)}

$execute if data storage vortex:engine _time_of_tmp{action:"set"} run time set $(value)
$execute if data storage vortex:engine _time_of_tmp{action:"add"} run time add $(value)
$execute if data storage vortex:engine _time_of_tmp{action:"query"} run return run time query $(value)
execute if data storage vortex:engine _time_of_tmp{action:"pause"} run gamerule doDaylightCycle false
execute if data storage vortex:engine _time_of_tmp{action:"resume"} run gamerule doDaylightCycle true
execute if data storage vortex:engine _time_of_tmp{action:"rate"} run tellraw @s [{"text":"[VORTEX] ","color":"red"},{"text":"time_of: 'rate' has no 1.21.8 equivalent (per-clock rate needs the 26.x clock system). Not supported.","color":"gray"}]

data remove storage vortex:engine _time_of_tmp
