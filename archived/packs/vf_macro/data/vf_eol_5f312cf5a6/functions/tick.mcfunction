execute if score #phase vfE5f312cf5a6 matches 1..2 run scoreboard players add #ticks vfE5f312cf5a6 1
function vf_eol_5f312cf5a6:refresh
execute unless score #last vfE5f312cf5a6 = #phase vfE5f312cf5a6 run function vf_eol_5f312cf5a6:notice
execute if score #phase vfE5f312cf5a6 matches 3 if score #cleaned vfE5f312cf5a6 matches 0 run function vf_eol_5f312cf5a6:cleanup
