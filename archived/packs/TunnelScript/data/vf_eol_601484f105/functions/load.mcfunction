execute unless data storage vf_eol_601484f105:lifecycle initialized run scoreboard objectives add vfE601484f105 dummy
data modify storage vf_eol_601484f105:lifecycle initialized set value 1b
scoreboard players add #ticks vfE601484f105 0
scoreboard players add #phase vfE601484f105 0
scoreboard players add #last vfE601484f105 0
scoreboard players add #cleaned vfE601484f105 0
function vf_eol_601484f105:refresh
execute unless score #last vfE601484f105 = #phase vfE601484f105 run function vf_eol_601484f105:notice
