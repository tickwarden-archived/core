# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:api/title/show_team_p [MACRO]
# show_p for every online member of a team. Input (macro arg): team. Storage input as show_p.
execute if data storage macroengine:engine modules{title:0b} run return 0
$execute as @a[team=$(team)] run function macroengine:api/title/show_p
