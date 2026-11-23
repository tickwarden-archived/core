# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/player/var/increment [MACRO]
$execute store result score $pvar vortex.tmp run data get storage vortex:engine players.$(player).$(key)
scoreboard players add $pvar vortex.tmp 1
$execute store result storage vortex:engine players.$(player).$(key) int 1 run scoreboard players get $pvar vortex.tmp
execute store result storage vortex:output result int 1 run scoreboard players get $pvar vortex.tmp
