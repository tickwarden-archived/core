# vortex:core/state/set_score
# Sets a player's integer state on the vortex.state scoreboard.
# Usage: $function vortex:core/state/set_score {value:1}
# States: 0=idle 1=combat 2=menu (define your own)
$scoreboard players set @s vortex.state $(value)
