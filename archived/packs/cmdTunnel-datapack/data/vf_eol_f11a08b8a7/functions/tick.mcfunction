execute if score #phase vfEf11a08b8a7 matches 1..2 run scoreboard players add #ticks vfEf11a08b8a7 1
function vf_eol_f11a08b8a7:refresh
execute unless score #last vfEf11a08b8a7 = #phase vfEf11a08b8a7 run function vf_eol_f11a08b8a7:notice
execute if score #phase vfEf11a08b8a7 matches 3 if score #cleaned vfEf11a08b8a7 matches 0 run function vf_eol_f11a08b8a7:cleanup
