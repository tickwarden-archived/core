# ─────────────────────────────────────────────────────────────────
# vortex:api/wand/register_cmd
# Binds a raw command to a wand (carrot_on_a_stick).
#
# INPUT (storage vortex:input):
#   tag → custom_data tag name
#   cmd → raw command to run
# ─────────────────────────────────────────────────────────────────
execute if data storage vortex:engine modules{wand:0b} run return 0
execute unless data storage vortex:engine wand_binds run data modify storage vortex:engine wand_binds set value []
function vortex:core/internal/api/wand/register_cmd_do with storage vortex:input {}
