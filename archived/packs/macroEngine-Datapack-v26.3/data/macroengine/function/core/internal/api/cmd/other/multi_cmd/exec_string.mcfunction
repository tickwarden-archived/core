# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# macroengine:api/cmd/other/multi_cmd/internal/exec_string
# Execute simple string command
# _mcmd_current is a plain string e.g. "say Hello"
# ─────────────────────────────────────────────────────────────────

# Wrap string into object
data modify storage macroengine:engine _mcmd_exec set value {}
data modify storage macroengine:engine _mcmd_exec.cmd set from storage macroengine:engine _mcmd_current

# Execute via macro
function macroengine:core/internal/api/cmd/other/multi_cmd/exec_macro with storage macroengine:engine _mcmd_exec

# Cleanup
data remove storage macroengine:engine _mcmd_exec
