# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/state/set_score
# Sets a player's integer state on the macroengine.state scoreboard.
# Usage: $function macroengine:core/state/set_score {value:1}
# States: 0=idle 1=combat 2=menu (define your own)
$scoreboard players set @s macroengine.state $(value)
