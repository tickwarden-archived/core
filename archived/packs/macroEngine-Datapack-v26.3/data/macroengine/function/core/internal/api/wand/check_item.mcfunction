# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:api/wand/internal/check_item [MACRO]
# $(tag) → custom_data tag name
# If the item in the player's main hand has this tag, run the bind.

$execute if items entity @s weapon.mainhand *[minecraft:custom_data~{wand:"$(tag)"}] run function macroengine:core/internal/api/wand/fire with storage macroengine:engine _wand_current
