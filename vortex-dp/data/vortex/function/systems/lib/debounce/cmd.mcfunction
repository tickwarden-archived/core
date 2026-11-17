# vortex:systems/lib/debounce/cmd [MACRO]
$execute if data storage vortex:engine schedules.$(key) run return 0

function vortex:core/internal/core/lib/schedule/cmd with storage vortex:input {}
