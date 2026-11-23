# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:api/title/actionbar_all_p
# actionbar_p for every online player. Storage input as actionbar_p.
execute if data storage macroengine:engine modules{title:0b} run return 0
execute as @a run function macroengine:api/title/actionbar_p
