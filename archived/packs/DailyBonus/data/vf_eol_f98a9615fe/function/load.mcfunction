execute unless data storage vf_eol_f98a9615fe:lifecycle initialized run scoreboard objectives add vfEf98a9615fe dummy
data modify storage vf_eol_f98a9615fe:lifecycle initialized set value 1b
scoreboard players add #ticks vfEf98a9615fe 0
scoreboard players add #phase vfEf98a9615fe 0
scoreboard players add #last vfEf98a9615fe 0
scoreboard players add #cleaned vfEf98a9615fe 0
function vf_eol_f98a9615fe:refresh
execute unless score #last vfEf98a9615fe = #phase vfEf98a9615fe run function vf_eol_f98a9615fe:notice
