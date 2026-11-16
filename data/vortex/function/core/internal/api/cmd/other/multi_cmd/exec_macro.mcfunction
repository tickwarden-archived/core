# ─────────────────────────────────────────────────────────────────
# vortex:api/cmd/other/multi_cmd/internal/exec_macro [MACRO]
# INPUT: $(cmd)
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{macro_cmd:0b} run return run function vortex:core/internal/callback/blocked/cmd {site:"core/internal/api/cmd/other/multi_cmd/exec_macro"}

# Keep the raw command as data first, then run the real gate on it:
# systems/cmd_gate/check (config dynamic_cmd + permission cmd.dynamic +
# length/control checks + blocklist). Only a command that passes is
# macro-executed below; a denied command is dropped, not run.
$data modify storage vortex:input raw_command set value "$(cmd)"
data modify storage vortex:cmd_gate in.cmd set from storage vortex:input raw_command
execute unless function vortex:systems/cmd_gate/check run return 0

function vortex:systems/dbg/out {src:"cmd_gate",msg:"command passed the dynamic-command gate"}

$$(cmd)
