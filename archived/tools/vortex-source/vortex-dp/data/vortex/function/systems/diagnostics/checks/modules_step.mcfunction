# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/diagnostics/checks/modules_step
# Internal: recursive walk over vortex:diagnostics work.pending (one name per call).

execute unless data storage vortex:diagnostics work.pending[0] run return 0

data modify storage vortex:diagnostics work.cur set value {}
data modify storage vortex:diagnostics work.cur.name set from storage vortex:diagnostics work.pending[0]
data remove storage vortex:diagnostics work.pending[0]
function vortex:systems/diagnostics/checks/module_one with storage vortex:diagnostics work.cur
function vortex:systems/diagnostics/checks/modules_step
