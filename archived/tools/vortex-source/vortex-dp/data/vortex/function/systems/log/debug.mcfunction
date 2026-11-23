# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/log/debug
# Usage: $function vortex:systems/log/debug {message:"[System] Trace detail"}
# Level: 4 — only shown when debug mode active
execute if data storage vortex:engine modules{log:0b} run return 0
$data modify storage vortex:engine _log_add_tmp.message set value "$(message)"
data modify storage vortex:engine _log_add_tmp.level set value "DEBUG"
data modify storage vortex:engine _log_add_tmp.color set value "dark_gray"
execute if score #vortex.log_level vortex.log_level matches 4.. run function vortex:systems/log/add with storage vortex:engine _log_add_tmp
