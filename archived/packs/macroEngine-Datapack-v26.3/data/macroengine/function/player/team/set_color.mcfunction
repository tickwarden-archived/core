# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:player/team/set_color [MACRO]
$team modify $(team) color $(color)
$data modify storage macroengine:engine teams.$(team).color set value "$(color)"
