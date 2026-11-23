# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# Post-hook runner
function vortex:core/internal/api/cmd/other/multi_cmd/hook_post_exec with storage vortex:engine _mcmd_current
