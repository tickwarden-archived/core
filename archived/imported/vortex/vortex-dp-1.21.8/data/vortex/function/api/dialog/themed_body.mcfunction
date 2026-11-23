# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/dialog/themed_body [MACRO]
$data modify storage vortex:dialog_theme args.text set value $(text)
data modify storage vortex:dialog_theme args.width set value 300
execute if data storage vortex:dialog_work theme.body_width run data modify storage vortex:dialog_theme args.width set from storage vortex:dialog_work theme.body_width
function vortex:api/dialog/body with storage vortex:dialog_theme args
