# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/player/team/create [MACRO]
$team add $(team)
$data modify storage vortex:engine teams.$(team) set value {color:"white",friendly_fire:"true",see_friendly_invisibles:"false"}
