# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/dialog/progress_style [MACRO]
$data modify storage vortex:dialog_progress style set value {segments:$(segments),width:$(width),filled:$(filled),empty:$(empty)}
execute store result score #bar_segments vortex.dialog_tmp run data get storage vortex:dialog_progress style.segments
execute store result score #bar_width vortex.dialog_tmp run data get storage vortex:dialog_progress style.width
execute unless score #bar_segments vortex.dialog_tmp matches 1..64 run return 0
execute unless score #bar_width vortex.dialog_tmp matches 1..1024 run return 0
data modify storage vortex:dialog_work progress_style set from storage vortex:dialog_progress style
return 1
