# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:player/team/set_friendly_fire [MACRO]
$team modify $(team) friendlyFire $(value)
$data modify storage macroengine:engine teams.$(team).friendly_fire set value "$(value)"
