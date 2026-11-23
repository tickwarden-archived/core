# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/math/vec/angle_exec [MACRO]
# INPUT: $(ax), $(ay), $(az), $(bx), $(by), $(bz)
# RULE: Lines without $(var) must NOT have a $ prefix.

function vortex:core/runtime/input_push

$data modify storage vortex:engine _vec_dot_tmp ax set value $(ax)
$data modify storage vortex:engine _vec_dot_tmp ay set value $(ay)
$data modify storage vortex:engine _vec_dot_tmp az set value $(az)
$data modify storage vortex:engine _vec_dot_tmp bx set value $(bx)
$data modify storage vortex:engine _vec_dot_tmp by set value $(by)
$data modify storage vortex:engine _vec_dot_tmp bz set value $(bz)
function vortex:systems/math/vec/dot with storage vortex:engine _vec_dot_tmp
execute store result score $vang_dot vortex.tmp run data get storage vortex:output result

data modify storage vortex:engine _math_d3d_tmp.x1 set value 0
data modify storage vortex:engine _math_d3d_tmp.y1 set value 0
data modify storage vortex:engine _math_d3d_tmp.z1 set value 0
$data modify storage vortex:engine _math_d3d_tmp x2 set value $(ax)
$data modify storage vortex:engine _math_d3d_tmp y2 set value $(ay)
$data modify storage vortex:engine _math_d3d_tmp z2 set value $(az)
function vortex:systems/math/distance3d with storage vortex:engine _math_d3d_tmp
execute store result score $vang_la vortex.tmp run data get storage vortex:output result

$data modify storage vortex:engine _math_d3d_tmp x2 set value $(bx)
$data modify storage vortex:engine _math_d3d_tmp y2 set value $(by)
$data modify storage vortex:engine _math_d3d_tmp z2 set value $(bz)
function vortex:systems/math/distance3d with storage vortex:engine _math_d3d_tmp
execute store result score $vang_lb vortex.tmp run data get storage vortex:output result

function vortex:core/runtime/input_pop

data modify storage vortex:output result set value 0

execute if score $vang_la vortex.tmp matches 0 run return 0
execute if score $vang_lb vortex.tmp matches 0 run return 0

scoreboard players set $vang_1000 vortex.tmp 1000
scoreboard players operation $vang_dot vortex.tmp *= $vang_1000 vortex.tmp
scoreboard players operation $vang_la vortex.tmp *= $vang_lb vortex.tmp
scoreboard players operation $vang_dot vortex.tmp /= $vang_la vortex.tmp

execute if score $vang_dot vortex.tmp matches 1001.. run scoreboard players set $vang_dot vortex.tmp 1000
execute if score $vang_dot vortex.tmp matches ..-1001 run scoreboard players set $vang_dot vortex.tmp -1000

function vortex:core/internal/systems/math/vec/arccos_lookup
