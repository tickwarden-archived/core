# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/state/set_score
# Sets a player's integer state on the vortex.state scoreboard.
# Usage: $function vortex:api/state/set_score {value:1}
# States: 0=idle 1=combat 2=menu (define your own)
$scoreboard players set @s vortex.state $(value)
