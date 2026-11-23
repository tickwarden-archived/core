# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# macroengine:api/wand/register_fn
# Binds a function to a wand (carrot_on_a_stick).
#
# INPUT (storage macroengine:input):
#   tag  → custom_data tag name
#   func → function to run
# ─────────────────────────────────────────────────────────────────
execute if data storage macroengine:engine modules{wand:0b} run return 0
execute unless data storage macroengine:engine wand_binds run data modify storage macroengine:engine wand_binds set value []
function macroengine:core/internal/api/wand/register_fn_do with storage macroengine:input {}
