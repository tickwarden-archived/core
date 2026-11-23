execute if score #phase vfE55b54ff038 matches 1..2 run scoreboard players add #ticks vfE55b54ff038 1
function vf_eol_55b54ff038:refresh
execute unless score #last vfE55b54ff038 = #phase vfE55b54ff038 run function vf_eol_55b54ff038:notice
execute if score #phase vfE55b54ff038 matches 3 if score #cleaned vfE55b54ff038 matches 0 run function vf_eol_55b54ff038:cleanup
