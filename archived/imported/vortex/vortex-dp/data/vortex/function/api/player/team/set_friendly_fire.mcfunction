# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/player/team/set_friendly_fire [MACRO]
$team modify $(team) friendlyFire $(value)
$data modify storage vortex:engine teams.$(team).friendly_fire set value "$(value)"
