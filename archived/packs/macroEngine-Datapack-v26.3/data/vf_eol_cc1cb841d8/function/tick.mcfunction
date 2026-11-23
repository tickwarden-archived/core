execute if score #phase vfEcc1cb841d8 matches 1..2 run scoreboard players add #ticks vfEcc1cb841d8 1
function vf_eol_cc1cb841d8:refresh
execute unless score #last vfEcc1cb841d8 = #phase vfEcc1cb841d8 run function vf_eol_cc1cb841d8:notice
execute if score #phase vfEcc1cb841d8 matches 3 if score #cleaned vfEcc1cb841d8 matches 0 run function vf_eol_cc1cb841d8:cleanup
