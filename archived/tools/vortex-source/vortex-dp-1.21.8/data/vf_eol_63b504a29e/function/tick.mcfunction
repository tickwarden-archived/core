execute if score #phase vfE63b504a29e matches 1..2 run scoreboard players add #ticks vfE63b504a29e 1
function vf_eol_63b504a29e:refresh
execute unless score #last vfE63b504a29e = #phase vfE63b504a29e run function vf_eol_63b504a29e:notice
execute if score #phase vfE63b504a29e matches 3 if score #cleaned vfE63b504a29e matches 0 run function vf_eol_63b504a29e:cleanup
