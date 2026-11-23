# vortex:core/internal/dialog/sort_pick [MACRO]
$data modify storage vortex:dialog_sort sorted append from storage vortex:dialog_sort remaining[$(index)]
$data remove storage vortex:dialog_sort remaining[$(index)]
