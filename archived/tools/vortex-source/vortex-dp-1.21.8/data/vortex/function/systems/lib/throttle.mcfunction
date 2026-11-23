# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/lib/throttle [MACRO]
scoreboard players set $thr_go vortex.tmp 1

$execute if data storage vortex:engine throttle.$(key) run execute store result score $thr_exp vortex.tmp run data get storage vortex:engine throttle.$(key)
execute store result score $thr_now vortex.tmp run scoreboard players get $epoch vortex.time
$execute if data storage vortex:engine throttle.$(key) run execute if score $thr_now vortex.tmp < $thr_exp vortex.tmp run scoreboard players set $thr_go vortex.tmp 0

execute if score $thr_go vortex.tmp matches 0 run return 0

$scoreboard players set $thr_int vortex.tmp $(interval)
scoreboard players operation $thr_now vortex.tmp += $thr_int vortex.tmp
$execute store result storage vortex:engine throttle.$(key) int 1 run scoreboard players get $thr_now vortex.tmp

function vortex:core/internal/core/lib/queue/add with storage vortex:input {}
