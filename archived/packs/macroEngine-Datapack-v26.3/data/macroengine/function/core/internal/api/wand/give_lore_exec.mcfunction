# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:api/wand/internal/give_lore_exec [MACRO]
# INPUT (macro): $(player), $(tag), $(name), $(lore), $(color)
#
# Writes with lore directly to mainhand via item replace weapon.mainhand.
# Not give but item replace — places directly in slot 0 (mainhand).

$item replace entity @a[name=$(player),limit=1] weapon.mainhand with minecraft:carrot_on_a_stick[minecraft:custom_data={wand:"$(tag)"},minecraft:item_name={"text":"$(name)"},minecraft:lore=[{"text":"$(lore)","italic":false,"color":"$(color)"}],minecraft:enchantment_glint_override=true]
