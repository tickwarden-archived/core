# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/player/team/set_friendly_fire [MACRO]
$team modify $(team) friendlyFire $(value)
$data modify storage vortex:engine teams.$(team).friendly_fire set value "$(value)"
