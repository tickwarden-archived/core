# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# Post-hook runner
function vortex:core/internal/api/cmd/other/multi_cmd/hook_post_exec with storage vortex:engine _mcmd_current
