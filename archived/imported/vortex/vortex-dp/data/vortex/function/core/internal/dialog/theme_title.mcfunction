# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/theme_title
execute if data storage vortex:dialog_work theme.title run data modify storage vortex:dialog_work dialog.title merge from storage vortex:dialog_work theme.title
