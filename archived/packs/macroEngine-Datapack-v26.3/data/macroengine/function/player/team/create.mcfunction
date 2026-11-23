# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:player/team/create [MACRO]
$team add $(team)
$data modify storage macroengine:engine teams.$(team) set value {color:"white",friendly_fire:"true",see_friendly_invisibles:"false"}
