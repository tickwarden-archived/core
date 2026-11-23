# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:player/team/delete [MACRO]
$team remove $(team)
$data remove storage macroengine:engine teams.$(team)
