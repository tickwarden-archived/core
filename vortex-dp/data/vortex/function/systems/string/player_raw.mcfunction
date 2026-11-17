# vortex:systems/string/player_raw [MACRO]
execute if data storage vortex:engine modules{string:0b} run return 0
$tellraw $(target) $(json)
