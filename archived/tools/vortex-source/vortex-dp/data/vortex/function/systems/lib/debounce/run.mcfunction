# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/lib/debounce/run [MACRO]
$execute if data storage vortex:engine schedules.$(key) run return 0

function vortex:core/runtime/schedule with storage vortex:input {}
