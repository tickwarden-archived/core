execute unless data storage vf_eol_63b504a29e:lifecycle initialized run scoreboard objectives add vfE63b504a29e dummy
data modify storage vf_eol_63b504a29e:lifecycle initialized set value 1b
scoreboard players add #ticks vfE63b504a29e 0
scoreboard players add #phase vfE63b504a29e 0
scoreboard players add #last vfE63b504a29e 0
scoreboard players add #cleaned vfE63b504a29e 0
function vf_eol_63b504a29e:refresh
execute unless score #last vfE63b504a29e = #phase vfE63b504a29e run function vf_eol_63b504a29e:notice
