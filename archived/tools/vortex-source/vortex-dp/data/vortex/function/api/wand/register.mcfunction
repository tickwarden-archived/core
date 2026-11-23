# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:api/wand/register
# Registers a wand with a specific custom_data tag.
# On every item use, $(func) or $(cmd) runs.
#
# INPUT (storage vortex:input):
#   tag  → custom_data tag name (e.g. "my_wand")
#   func → (optional) function to run
#   cmd  → (optional) command to run (if no func)
#
# USAGE:
#   data modify storage vortex:input tag set value "fire_wand"
#   data modify storage vortex:input func set value "mypack:on_fire_wand"
#   function vortex:api/wand/register with storage vortex:input {}
# ─────────────────────────────────────────────────────────────────
execute if data storage vortex:engine modules{wand:0b} run return 0
execute unless data storage vortex:engine wand_binds run data modify storage vortex:engine wand_binds set value []
function vortex:core/internal/api/wand/register_do with storage vortex:input {}
