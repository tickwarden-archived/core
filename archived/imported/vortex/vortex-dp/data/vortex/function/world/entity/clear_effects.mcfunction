# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:world/entity/clear_effects
# Clears all active potion effects from entities matching type+tag.
#
# INPUT : $(type) → entity type selector (e.g. "minecraft:player")
#         $(tag)  → entity tag filter
# ─────────────────────────────────────────────────────────────────

$effect clear @e[type=$(type),tag=$(tag)]
