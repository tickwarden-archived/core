# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:input/give/writable_book
give @s minecraft:writable_book[minecraft:custom_data={macroengine:{input:1b,inputItem:"writable_book"}}] 1
