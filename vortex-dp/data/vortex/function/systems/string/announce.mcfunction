# vortex:systems/string/announce [MACRO]
execute if data storage vortex:engine modules{string:0b} run return 0
$tellraw @a {"text":"$(message)","color":"$(color)"}
