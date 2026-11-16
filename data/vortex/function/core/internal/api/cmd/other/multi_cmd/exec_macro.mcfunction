# ─────────────────────────────────────────────────────────────────
# vortex:core/internal/api/cmd/other/multi_cmd/exec_macro [MACRO]
# INPUT: $(cmd)
# ─────────────────────────────────────────────────────────────────

function vortex:systems/dbg/out {src:"multi_cmd",msg:"command executed"}

$$(cmd)
