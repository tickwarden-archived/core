# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/cooldown/extend [MACRO]
execute store result score $ce_base vortex.tmp run scoreboard players get $epoch vortex.time
scoreboard players operation $ce_exp vortex.tmp = $ce_base vortex.tmp

$execute if data storage vortex:engine cooldowns.$(player).$(key) run execute store result score $ce_exp vortex.tmp run data get storage vortex:engine cooldowns.$(player).$(key)

execute if score $ce_exp vortex.tmp <= $ce_base vortex.tmp run scoreboard players operation $ce_exp vortex.tmp = $ce_base vortex.tmp

$scoreboard players set $ce_amt vortex.tmp $(amount)
scoreboard players operation $ce_exp vortex.tmp += $ce_amt vortex.tmp

$execute store result storage vortex:engine cooldowns.$(player).$(key) int 1 run scoreboard players get $ce_exp vortex.tmp
