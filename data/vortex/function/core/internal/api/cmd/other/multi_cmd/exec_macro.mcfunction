# ─────────────────────────────────────────────────────────────────
# vortex:core/internal/api/cmd/other/multi_cmd/exec_macro [MACRO]
# INPUT: $(cmd)
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{macro_cmd:0b} run return run function vortex:core/internal/callback/blocked/cmd {site:"core/internal/api/cmd/other/multi_cmd/exec_macro"}
function vortex:systems/dbg/out {src:"multi_cmd",msg:"command executed"}

$$(cmd)
