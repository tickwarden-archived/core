# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:api/player/inv/offhand_item
# Runs a command/function for each player in @a whose offhand
# matches the given item id and custom data.
# Mirrors the pattern of vortex:api/player/inv/selected_item (mainhand).
#
# INPUT : $(item)       → item id (e.g. "minecraft:shield")
#         $(custom_data) → custom_data compound to match (e.g. "{my_tag:1b}")
#         $(invoke)     → command to run as the matching player
#
# EXAMPLE:
# function vortex:api/player/inv/offhand_item {item:"minecraft:shield",custom_data:"{my_tag:1b}",invoke:"function mypack:on_shield"}
# ─────────────────────────────────────────────────────────────────

$execute as @a[name=$(player),limit=1] at @s if items entity @s weapon.offhand $(item)[minecraft:custom_data=$(custom_data)] run $(invoke)
