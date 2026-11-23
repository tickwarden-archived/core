execute if score #phase vfEc8645e117f matches 1..2 run scoreboard players add #ticks vfEc8645e117f 1
function vf_eol_c8645e117f:refresh
execute unless score #last vfEc8645e117f = #phase vfEc8645e117f run function vf_eol_c8645e117f:notice
execute if score #phase vfEc8645e117f matches 3 if score #cleaned vfEc8645e117f matches 0 run function vf_eol_c8645e117f:cleanup
