# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/math/map [MACRO]
execute if data storage vortex:engine modules{math:0b} run return 0
$scoreboard players set $map_v vortex.tmp $(value)
$scoreboard players set $map_imin vortex.tmp $(in_min)
$scoreboard players set $map_imax vortex.tmp $(in_max)
$scoreboard players set $map_omin vortex.tmp $(out_min)
$scoreboard players set $map_omax vortex.tmp $(out_max)

scoreboard players operation $map_ir vortex.tmp = $map_imax vortex.tmp
scoreboard players operation $map_ir vortex.tmp -= $map_imin vortex.tmp

execute if score $map_ir vortex.tmp matches 0 run execute store result storage vortex:output result int 1 run scoreboard players get $map_omin vortex.tmp
execute if score $map_ir vortex.tmp matches 0 run return 0

scoreboard players operation $map_or vortex.tmp = $map_omax vortex.tmp
scoreboard players operation $map_or vortex.tmp -= $map_omin vortex.tmp

scoreboard players operation $map_off vortex.tmp = $map_v vortex.tmp
scoreboard players operation $map_off vortex.tmp -= $map_imin vortex.tmp

scoreboard players operation $map_off vortex.tmp *= $map_or vortex.tmp
scoreboard players operation $map_off vortex.tmp /= $map_ir vortex.tmp
scoreboard players operation $map_off vortex.tmp += $map_omin vortex.tmp

execute store result storage vortex:output result int 1 run scoreboard players get $map_off vortex.tmp
