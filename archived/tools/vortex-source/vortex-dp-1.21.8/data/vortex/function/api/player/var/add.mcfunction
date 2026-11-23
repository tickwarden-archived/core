# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/player/var/add [MACRO]
$execute store result score $pvar vortex.tmp run data get storage vortex:engine players.$(player).$(key)
$scoreboard players set $pamount vortex.tmp $(amount)
scoreboard players operation $pvar vortex.tmp += $pamount vortex.tmp
$execute store result storage vortex:engine players.$(player).$(key) int 1 run scoreboard players get $pvar vortex.tmp
execute store result storage vortex:output result int 1 run scoreboard players get $pvar vortex.tmp
