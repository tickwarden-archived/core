execute if score #phase vfE601484f105 matches 1..2 run scoreboard players add #ticks vfE601484f105 1
function vf_eol_601484f105:refresh
execute unless score #last vfE601484f105 = #phase vfE601484f105 run function vf_eol_601484f105:notice
execute if score #phase vfE601484f105 matches 3 if score #cleaned vfE601484f105 matches 0 run function vf_eol_601484f105:cleanup
