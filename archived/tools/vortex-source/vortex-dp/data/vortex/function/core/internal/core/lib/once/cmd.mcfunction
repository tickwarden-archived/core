# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/core/lib/once/cmd [MACRO]
execute if data storage vortex:engine modules{macro_cmd:0b} run return run function vortex:core/internal/callback/blocked/cmd {site:"core/internal/core/lib/once/cmd"}
$execute if data storage vortex:engine once_keys.$(key) run return 0

$data modify storage vortex:engine once_keys.$(key) set value 1b

$$(cmd)
