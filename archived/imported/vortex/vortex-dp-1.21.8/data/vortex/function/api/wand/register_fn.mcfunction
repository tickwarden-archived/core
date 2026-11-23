# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:api/wand/register_fn
# Binds a function to a wand (carrot_on_a_stick).
#
# INPUT (storage vortex:input):
#   tag  → custom_data tag name
#   func → function to run
# ─────────────────────────────────────────────────────────────────
execute if data storage vortex:engine modules{wand:0b} run return 0
execute unless data storage vortex:engine wand_binds run data modify storage vortex:engine wand_binds set value []
function vortex:core/internal/api/wand/register_fn_do with storage vortex:input {}
