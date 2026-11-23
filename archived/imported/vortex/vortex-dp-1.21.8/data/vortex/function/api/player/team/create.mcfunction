# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/player/team/create [MACRO]
$team add $(team)
$data modify storage vortex:engine teams.$(team) set value {color:"white",friendly_fire:"true",see_friendly_invisibles:"false"}
