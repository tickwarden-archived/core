execute if score #phase vfE46942fd13a matches 1..2 run scoreboard players add #ticks vfE46942fd13a 1
function vf_eol_46942fd13a:refresh
execute unless score #last vfE46942fd13a = #phase vfE46942fd13a run function vf_eol_46942fd13a:notice
execute if score #phase vfE46942fd13a matches 3 if score #cleaned vfE46942fd13a matches 0 run function vf_eol_46942fd13a:cleanup
