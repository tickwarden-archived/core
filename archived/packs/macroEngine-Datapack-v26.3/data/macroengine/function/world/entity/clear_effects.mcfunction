# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# macroengine:world/entity/clear_effects
# Clears all active potion effects from entities matching type+tag.
#
# INPUT : $(type) → entity type selector (e.g. "minecraft:player")
#         $(tag)  → entity tag filter
# ─────────────────────────────────────────────────────────────────

$effect clear @e[type=$(type),tag=$(tag)]
