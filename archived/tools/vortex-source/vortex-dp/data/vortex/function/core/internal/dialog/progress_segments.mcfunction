# vortex:core/internal/dialog/progress_segments
execute unless score #bar_index vortex.dialog_tmp < #bar_segments vortex.dialog_tmp run return 0
execute if score #bar_index vortex.dialog_tmp < #bar_fill vortex.dialog_tmp run data modify storage vortex:dialog_progress component.extra append from storage vortex:dialog_work progress_style.filled
execute unless score #bar_index vortex.dialog_tmp < #bar_fill vortex.dialog_tmp run data modify storage vortex:dialog_progress component.extra append from storage vortex:dialog_work progress_style.empty
scoreboard players add #bar_index vortex.dialog_tmp 1
function vortex:core/internal/dialog/progress_segments
