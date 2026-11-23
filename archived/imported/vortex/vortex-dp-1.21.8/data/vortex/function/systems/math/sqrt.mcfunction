# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/math/sqrt [MACRO]
execute if data storage vortex:engine modules{math:0b} run return 0
$scoreboard players set $sqrt_n vortex.tmp $(value)

execute if score $sqrt_n vortex.tmp matches ..0 run data modify storage vortex:output result set value 0
execute if score $sqrt_n vortex.tmp matches ..0 run return 0

execute if score $sqrt_n vortex.tmp matches 1 run data modify storage vortex:output result set value 1
execute if score $sqrt_n vortex.tmp matches 1 run return 0

scoreboard players set $sqrt_lo vortex.tmp 0
scoreboard players operation $sqrt_hi vortex.tmp = $sqrt_n vortex.tmp
execute if score $sqrt_hi vortex.tmp matches 46342.. run scoreboard players set $sqrt_hi vortex.tmp 46341

scoreboard players set $sqrt_itr vortex.tmp 16
function vortex:core/internal/systems/math/sqrt_step

execute store result storage vortex:output result int 1 run scoreboard players get $sqrt_lo vortex.tmp
