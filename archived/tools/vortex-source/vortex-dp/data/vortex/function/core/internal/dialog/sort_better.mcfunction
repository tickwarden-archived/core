# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/sort_better
scoreboard players operation #sort_rank vortex.dialog_tmp = #sort_candidate vortex.dialog_tmp
scoreboard players operation #sort_best vortex.dialog_tmp = #sort_index vortex.dialog_tmp
