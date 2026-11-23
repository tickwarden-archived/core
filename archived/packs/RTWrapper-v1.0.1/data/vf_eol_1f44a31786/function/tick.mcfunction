execute if score #phase vfE1f44a31786 matches 1..2 run scoreboard players add #ticks vfE1f44a31786 1
function vf_eol_1f44a31786:refresh
execute unless score #last vfE1f44a31786 = #phase vfE1f44a31786 run function vf_eol_1f44a31786:notice
execute if score #phase vfE1f44a31786 matches 3 if score #cleaned vfE1f44a31786 matches 0 run function vf_eol_1f44a31786:cleanup
