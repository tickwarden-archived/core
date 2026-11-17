# vortex:api/gamerule/set [MACRO]
# Sets a custom gamerule value, persists it in storage, and dispatches
# a callback function when the value matches a defined condition.
#
# INPUT (macro args via `with storage vortex:input {}`):
#   $(rule)      — rule name string, e.g. "pvp_enabled"
#   $(value)     — value string: "true", "false", or a number string e.g. "10"
#
# OPTIONAL storage keys (set before calling, removed after):
#   vortex:input gr_on_true   — function to call when value is "true"
#   vortex:input gr_on_false  — function to call when value is "false"
#   vortex:input gr_on_value  — function to call for any numeric match
#   vortex:input gr_matches   — scoreboard range string, e.g. "5..10" (used with gr_on_value)
#
# EXAMPLE:
#   data modify storage vortex:input rule set value "pvp_enabled"
#   data modify storage vortex:input value set value "true"
#   data modify storage vortex:input gr_on_true set value "mypack:pvp/enable"
#   data modify storage vortex:input gr_on_false set value "mypack:pvp/disable"
#   function vortex:api/gamerule/set with storage vortex:input {}
#
# RETURN: 1 on success, 0 on guard failure.

# Normalize key (spaces -> underscores, lowercase). Leaves _gamerule_norm unset when
# the name cannot be normalized safely (contains a quote or a backslash).
execute if data storage vortex:engine modules{gamerule:0b} run return 0
data remove storage vortex:input _gamerule_norm
function vortex:core/internal/api/gamerule/normalize

# ── Persist value in engine storage ──────────────────────────────────────────
function vortex:core/internal/api/gamerule/persist with storage vortex:input {}

# ── Dispatch callbacks ────────────────────────────────────────────────────────
function vortex:core/internal/api/gamerule/dispatch with storage vortex:input {}

# ── Cleanup ───────────────────────────────────────────────────────────────────
data remove storage vortex:input _gamerule_norm
