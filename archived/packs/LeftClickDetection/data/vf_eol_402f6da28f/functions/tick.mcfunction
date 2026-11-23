execute if score #phase vfE402f6da28f matches 1..2 run scoreboard players add #ticks vfE402f6da28f 1
function vf_eol_402f6da28f:refresh
execute unless score #last vfE402f6da28f = #phase vfE402f6da28f run function vf_eol_402f6da28f:notice
execute if score #phase vfE402f6da28f matches 3 if score #cleaned vfE402f6da28f matches 0 run function vf_eol_402f6da28f:cleanup
