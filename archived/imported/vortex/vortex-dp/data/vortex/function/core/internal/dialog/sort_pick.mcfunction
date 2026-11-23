# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/sort_pick [MACRO]
$data modify storage vortex:dialog_sort sorted append from storage vortex:dialog_sort remaining[$(index)]
$data remove storage vortex:dialog_sort remaining[$(index)]
