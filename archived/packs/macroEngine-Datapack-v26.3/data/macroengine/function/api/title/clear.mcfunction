# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:api/title/clear [MACRO]
# Clears the title currently shown to a player. Input (macro arg): player
execute if data storage macroengine:engine modules{title:0b} run return 0
$title @a[name=$(player),limit=1] clear
