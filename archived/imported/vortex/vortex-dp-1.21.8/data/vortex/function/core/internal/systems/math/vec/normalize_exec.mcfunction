# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/math/vec/normalize_exec [MACRO]
# INPUT: $(x), $(y), $(z)
# Compute length via math/distance3d, then ×1000 / length
# RULE: Lines without $(var) must NOT have a $ prefix.

function vortex:core/runtime/input_push

data modify storage vortex:engine _math_d3d_tmp.x1 set value 0
data modify storage vortex:engine _math_d3d_tmp.y1 set value 0
data modify storage vortex:engine _math_d3d_tmp.z1 set value 0
$data modify storage vortex:engine _math_d3d_tmp x2 set value $(x)
$data modify storage vortex:engine _math_d3d_tmp y2 set value $(y)
$data modify storage vortex:engine _math_d3d_tmp z2 set value $(z)
function vortex:systems/math/distance3d with storage vortex:engine _math_d3d_tmp

function vortex:core/runtime/input_pop

execute store result score $vnlen vortex.tmp run data get storage vortex:output result

execute if score $vnlen vortex.tmp matches 0 run data modify storage vortex:output x set value 0
execute if score $vnlen vortex.tmp matches 0 run data modify storage vortex:output y set value 0
execute if score $vnlen vortex.tmp matches 0 run data modify storage vortex:output z set value 0
execute if score $vnlen vortex.tmp matches 0 run data modify storage vortex:output length set value 0
execute if score $vnlen vortex.tmp matches 0 run return 0

execute store result storage vortex:output length int 1 run scoreboard players get $vnlen vortex.tmp

$scoreboard players set $vnx vortex.tmp $(x)
scoreboard players set $vn1000 vortex.tmp 1000
scoreboard players operation $vnx vortex.tmp *= $vn1000 vortex.tmp
scoreboard players operation $vnx vortex.tmp /= $vnlen vortex.tmp
execute store result storage vortex:output x int 1 run scoreboard players get $vnx vortex.tmp

$scoreboard players set $vny vortex.tmp $(y)
scoreboard players operation $vny vortex.tmp *= $vn1000 vortex.tmp
scoreboard players operation $vny vortex.tmp /= $vnlen vortex.tmp
execute store result storage vortex:output y int 1 run scoreboard players get $vny vortex.tmp

$scoreboard players set $vnz vortex.tmp $(z)
scoreboard players operation $vnz vortex.tmp *= $vn1000 vortex.tmp
scoreboard players operation $vnz vortex.tmp /= $vnlen vortex.tmp
execute store result storage vortex:output z int 1 run scoreboard players get $vnz vortex.tmp
