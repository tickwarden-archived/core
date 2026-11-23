# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:api/wand/has
# Does the player hold a specific wand in their main hand?
#
# INPUT:
#   $(player) → player name
#   $(tag)    → wand tag to check
# OUTPUT:
# vortex:output result → 1b (found) / 0b (not found)
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{wand:0b} run return 0
data modify storage vortex:output result set value 0b
$execute as @a[name=$(player),limit=1] if items entity @s weapon.mainhand *[minecraft:custom_data~{wand:"$(tag)"}] run data modify storage vortex:output result set value 1b
