execute unless data storage vf_eol_cc1cb841d8:lifecycle initialized run scoreboard objectives add vfEcc1cb841d8 dummy
data modify storage vf_eol_cc1cb841d8:lifecycle initialized set value 1b
scoreboard players add #ticks vfEcc1cb841d8 0
scoreboard players add #phase vfEcc1cb841d8 0
scoreboard players add #last vfEcc1cb841d8 0
scoreboard players add #cleaned vfEcc1cb841d8 0
function vf_eol_cc1cb841d8:refresh
execute unless score #last vfEcc1cb841d8 = #phase vfEcc1cb841d8 run function vf_eol_cc1cb841d8:notice
