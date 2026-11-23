# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/player/var/set [MACRO]
$data modify storage vortex:engine players.$(player).$(key) set value $(value)
