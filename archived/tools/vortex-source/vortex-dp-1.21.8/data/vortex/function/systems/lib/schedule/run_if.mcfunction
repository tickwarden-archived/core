# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/lib/schedule/run_if
function vortex:core/internal/core/lib/queue/add with storage vortex:input {}
