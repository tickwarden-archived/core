# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/cooldown/set [MACRO]
$scoreboard players set $cd_dur vortex.tmp $(duration)
execute store result score $cd_now vortex.tmp run scoreboard players get $epoch vortex.time
scoreboard players operation $cd_now vortex.tmp += $cd_dur vortex.tmp
$execute store result storage vortex:engine cooldowns.$(player).$(key) int 1 run scoreboard players get $cd_now vortex.tmp
