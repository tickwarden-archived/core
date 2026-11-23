# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/gamerule/dispatch
# Evaluates the value and calls the appropriate callback function.
# Called exclusively by vortex:api/gamerule/set — do NOT call directly.
#
# INPUT (storage vortex:input):
#   value        — raw value string: "true", "false", or numeric string
#   gr_on_true   — (optional) function to call when value is "true"
#   gr_on_false  — (optional) function to call when value is "false"
#   gr_on_value  — (optional) function to call for numeric match
#   gr_matches   — (optional) scoreboard range string, e.g. "5..10"

# ── Boolean: true ────────────────────────────────────────────────────────────
execute if data storage vortex:input {value:"true"} if data storage vortex:input gr_on_true run return run function vortex:core/internal/api/gamerule/call_on_true with storage vortex:input {}

# ── Boolean: false ───────────────────────────────────────────────────────────
execute if data storage vortex:input {value:"false"} if data storage vortex:input gr_on_false run return run function vortex:core/internal/api/gamerule/call_on_false with storage vortex:input {}

# ── Numeric with explicit matches range ──────────────────────────────────────
execute if data storage vortex:input gr_on_value if data storage vortex:input gr_matches run function vortex:core/internal/api/gamerule/numeric_check with storage vortex:input {}
