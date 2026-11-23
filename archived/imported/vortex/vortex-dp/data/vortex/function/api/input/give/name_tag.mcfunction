# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/input/give/name_tag
# Gives a marked name_tag ready for input capture.
# The player renames it (via anvil) then holds it to submit.
give @s minecraft:name_tag[minecraft:custom_data={vortex:{input:1b,inputItem:"name_tag"}}] 1
