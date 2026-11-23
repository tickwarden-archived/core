# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/lib/ticks_to_time [MACRO]
$scoreboard players set $ttt_t vortex.tmp $(ticks)

execute if score $ttt_t vortex.tmp matches ..-1 run scoreboard players set $ttt_t vortex.tmp 0

scoreboard players operation $ttt_r vortex.tmp = $ttt_t vortex.tmp
scoreboard players set $ttt_20 vortex.tmp 20
scoreboard players operation $ttt_r vortex.tmp %= $ttt_20 vortex.tmp
execute store result storage vortex:output ticks int 1 run scoreboard players get $ttt_r vortex.tmp

scoreboard players operation $ttt_t vortex.tmp /= $ttt_20 vortex.tmp

scoreboard players operation $ttt_r vortex.tmp = $ttt_t vortex.tmp
scoreboard players set $ttt_60 vortex.tmp 60
scoreboard players operation $ttt_r vortex.tmp %= $ttt_60 vortex.tmp
execute store result storage vortex:output seconds int 1 run scoreboard players get $ttt_r vortex.tmp

scoreboard players operation $ttt_t vortex.tmp /= $ttt_60 vortex.tmp

scoreboard players operation $ttt_r vortex.tmp = $ttt_t vortex.tmp
scoreboard players operation $ttt_r vortex.tmp %= $ttt_60 vortex.tmp
execute store result storage vortex:output minutes int 1 run scoreboard players get $ttt_r vortex.tmp

scoreboard players operation $ttt_t vortex.tmp /= $ttt_60 vortex.tmp
execute store result storage vortex:output hours int 1 run scoreboard players get $ttt_t vortex.tmp
