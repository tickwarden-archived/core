# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:api/wand/unregister_all — Clears all wand binds.
execute if data storage macroengine:engine modules{wand:0b} run return 0
data modify storage macroengine:engine wand_binds set value []
