# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:input/give/name_tag
# Gives a marked name_tag ready for input capture.
# The player renames it (via anvil) then holds it to submit.
give @s minecraft:name_tag[minecraft:custom_data={macroengine:{input:1b,inputItem:"name_tag"}}] 1
