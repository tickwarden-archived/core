execute if score #phase vfEf98a9615fe matches 1..2 run scoreboard players add #ticks vfEf98a9615fe 1
function vf_eol_f98a9615fe:refresh
execute unless score #last vfEf98a9615fe = #phase vfEf98a9615fe run function vf_eol_f98a9615fe:notice
execute if score #phase vfEf98a9615fe matches 3 if score #cleaned vfEf98a9615fe matches 0 run function vf_eol_f98a9615fe:cleanup
