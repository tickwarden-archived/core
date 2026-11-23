# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/cooldown/remaining [MACRO]
data modify storage vortex:output result set value 0
$execute unless data storage vortex:engine cooldowns.$(player).$(key) run return 0

$execute store result score $cd_exp vortex.tmp run data get storage vortex:engine cooldowns.$(player).$(key)
execute store result score $cd_now vortex.tmp run scoreboard players get $epoch vortex.time

scoreboard players operation $cd_exp vortex.tmp -= $cd_now vortex.tmp
execute if score $cd_exp vortex.tmp matches 1.. run execute store result storage vortex:output result int 1 run scoreboard players get $cd_exp vortex.tmp
