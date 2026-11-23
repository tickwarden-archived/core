# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/player/team/delete [MACRO]
$team remove $(team)
$data remove storage vortex:engine teams.$(team)
