# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:api/wand/give
# Gives the player a carrot_on_a_stick marked as a wand.
# The item is automatically tagged with custom_data.
#
# INPUT:
#   $(player) → target player
#   $(tag)    → wand tag (written into custom_data)
#   $(name)   → item name (JSON text component, e.g. "Fire Wand")
#
# EXAMPLE:
# data modify storage vortex:input player set value "Steve"
# data modify storage vortex:input tag set value "fire_wand"
# data modify storage vortex:input name set value "Fire Wand"
# function vortex:api/wand/give with storage vortex:input {}
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{wand:0b} run return 0
$give @a[name=$(player),limit=1] minecraft:carrot_on_a_stick[minecraft:custom_data={wand:"$(tag)"},minecraft:item_name={"text":"$(name)"},minecraft:enchantment_glint_override=true]
