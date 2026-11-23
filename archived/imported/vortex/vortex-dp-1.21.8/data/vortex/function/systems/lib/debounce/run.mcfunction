# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/lib/debounce/run [MACRO]
$execute if data storage vortex:engine schedules.$(key) run return 0

function vortex:core/runtime/schedule with storage vortex:input {}
