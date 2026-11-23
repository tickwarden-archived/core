execute unless data storage vf_eol_c8645e117f:lifecycle initialized run scoreboard objectives add vfEc8645e117f dummy
data modify storage vf_eol_c8645e117f:lifecycle initialized set value 1b
scoreboard players add #ticks vfEc8645e117f 0
scoreboard players add #phase vfEc8645e117f 0
scoreboard players add #last vfEc8645e117f 0
scoreboard players add #cleaned vfEc8645e117f 0
function vf_eol_c8645e117f:refresh
execute unless score #last vfEc8645e117f = #phase vfEc8645e117f run function vf_eol_c8645e117f:notice
