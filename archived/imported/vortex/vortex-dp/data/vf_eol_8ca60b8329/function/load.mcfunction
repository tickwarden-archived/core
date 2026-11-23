execute unless data storage vf_eol_8ca60b8329:lifecycle initialized run scoreboard objectives add vfE8ca60b8329 dummy
data modify storage vf_eol_8ca60b8329:lifecycle initialized set value 1b
scoreboard players add #ticks vfE8ca60b8329 0
scoreboard players add #phase vfE8ca60b8329 0
scoreboard players add #last vfE8ca60b8329 0
scoreboard players add #cleaned vfE8ca60b8329 0
function vf_eol_8ca60b8329:refresh
execute unless score #last vfE8ca60b8329 = #phase vfE8ca60b8329 run function vf_eol_8ca60b8329:notice
