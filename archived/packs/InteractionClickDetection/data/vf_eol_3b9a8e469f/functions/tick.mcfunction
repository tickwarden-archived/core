execute if score #phase vfE3b9a8e469f matches 1..2 run scoreboard players add #ticks vfE3b9a8e469f 1
function vf_eol_3b9a8e469f:refresh
execute unless score #last vfE3b9a8e469f = #phase vfE3b9a8e469f run function vf_eol_3b9a8e469f:notice
execute if score #phase vfE3b9a8e469f matches 3 if score #cleaned vfE3b9a8e469f matches 0 run function vf_eol_3b9a8e469f:cleanup
