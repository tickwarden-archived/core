# ─────────────────────────────────────────────────────────────────
# vortex:api/wand/give_lore
# Writes the wand with lore to mainhand (item replace).
#
# INPUT (storage vortex:input):
# player → target player name
# tag → wand tag
# name → item name (string)
# lore → lore metni, TEK SATIR (string)
# color → lore color (e.g. "red", "gold", "gray")
#
# EXAMPLE:
# data modify storage vortex:input player set value "Steve"
# data modify storage vortex:input tag set value "fire_wand"
# data modify storage vortex:input name set value "Fire Wand"
# data modify storage vortex:input lore set value "Fire Damage: +20"
# data modify storage vortex:input color set value "red"
# function vortex:api/wand/give_lore
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{wand:0b} run return 0
function vortex:core/internal/api/wand/give_lore_exec with storage vortex:input {}
