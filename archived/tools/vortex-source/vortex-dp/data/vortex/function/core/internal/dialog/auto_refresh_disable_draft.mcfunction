# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/auto_refresh_disable_draft
data modify storage vortex:dialog_work refresh set value {}
return 1
