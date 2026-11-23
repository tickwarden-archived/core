# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/sort_outer
execute unless data storage vortex:dialog_sort remaining[0] run return 0
data modify storage vortex:dialog_sort scan set from storage vortex:dialog_sort remaining
scoreboard players set #sort_index vortex.dialog_tmp 0
scoreboard players set #sort_best vortex.dialog_tmp 0
scoreboard players set #sort_rank vortex.dialog_tmp 0
execute if data storage vortex:dialog_sort remaining[0].rank store result score #sort_rank vortex.dialog_tmp run data get storage vortex:dialog_sort remaining[0].rank
function vortex:core/internal/dialog/sort_scan
execute store result storage vortex:dialog_sort pick.index int 1 run scoreboard players get #sort_best vortex.dialog_tmp
function vortex:core/internal/dialog/sort_pick with storage vortex:dialog_sort pick
function vortex:core/internal/dialog/sort_outer
