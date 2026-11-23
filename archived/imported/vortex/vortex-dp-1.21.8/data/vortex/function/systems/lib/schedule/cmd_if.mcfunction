# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/lib/schedule/cmd_if
function vortex:core/internal/core/lib/queue/add_cmd with storage vortex:input {}
