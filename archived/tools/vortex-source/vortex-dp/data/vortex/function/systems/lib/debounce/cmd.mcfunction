# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/lib/debounce/cmd [MACRO]
$execute if data storage vortex:engine schedules.$(key) run return 0

function vortex:core/internal/core/lib/schedule/cmd with storage vortex:input {}
