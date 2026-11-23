# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/sort_scan
execute unless data storage vortex:dialog_sort scan[0] run return 0
scoreboard players set #sort_candidate vortex.dialog_tmp 0
execute if data storage vortex:dialog_sort scan[0].rank store result score #sort_candidate vortex.dialog_tmp run data get storage vortex:dialog_sort scan[0].rank
execute if score #sort_desc vortex.dialog_tmp matches 0 if score #sort_candidate vortex.dialog_tmp < #sort_rank vortex.dialog_tmp run function vortex:core/internal/dialog/sort_better
execute if score #sort_desc vortex.dialog_tmp matches 1 if score #sort_candidate vortex.dialog_tmp > #sort_rank vortex.dialog_tmp run function vortex:core/internal/dialog/sort_better
scoreboard players add #sort_index vortex.dialog_tmp 1
data remove storage vortex:dialog_sort scan[0]
function vortex:core/internal/dialog/sort_scan
