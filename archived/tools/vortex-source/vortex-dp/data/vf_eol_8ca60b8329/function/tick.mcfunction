execute if score #phase vfE8ca60b8329 matches 1..2 run scoreboard players add #ticks vfE8ca60b8329 1
function vf_eol_8ca60b8329:refresh
execute unless score #last vfE8ca60b8329 = #phase vfE8ca60b8329 run function vf_eol_8ca60b8329:notice
execute if score #phase vfE8ca60b8329 matches 3 if score #cleaned vfE8ca60b8329 matches 0 run function vf_eol_8ca60b8329:cleanup
