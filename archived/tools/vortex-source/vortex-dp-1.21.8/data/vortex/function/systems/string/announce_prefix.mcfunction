# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/string/announce_prefix [MACRO]
execute if data storage vortex:engine modules{string:0b} run return 0
$tellraw @a [{"text":"$(prefix) ","color":"$(prefix_color)","bold":true},{"text":"$(message)","color":"$(color)","bold":false}]
