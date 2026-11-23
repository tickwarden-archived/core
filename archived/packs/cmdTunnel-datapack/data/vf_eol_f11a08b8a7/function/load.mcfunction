execute unless data storage vf_eol_f11a08b8a7:lifecycle initialized run scoreboard objectives add vfEf11a08b8a7 dummy
data modify storage vf_eol_f11a08b8a7:lifecycle initialized set value 1b
scoreboard players add #ticks vfEf11a08b8a7 0
scoreboard players add #phase vfEf11a08b8a7 0
scoreboard players add #last vfEf11a08b8a7 0
scoreboard players add #cleaned vfEf11a08b8a7 0
function vf_eol_f11a08b8a7:refresh
execute unless score #last vfEf11a08b8a7 = #phase vfEf11a08b8a7 run function vf_eol_f11a08b8a7:notice
