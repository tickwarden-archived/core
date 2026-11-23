execute if score #phase vfE95ed379a2f matches 1..2 run scoreboard players add #ticks vfE95ed379a2f 1
function vf_eol_95ed379a2f:refresh
execute unless score #last vfE95ed379a2f = #phase vfE95ed379a2f run function vf_eol_95ed379a2f:notice
execute if score #phase vfE95ed379a2f matches 3 if score #cleaned vfE95ed379a2f matches 0 run function vf_eol_95ed379a2f:cleanup
