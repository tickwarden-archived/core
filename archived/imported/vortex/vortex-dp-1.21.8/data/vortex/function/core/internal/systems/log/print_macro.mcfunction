# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/log/print_macro [MACRO]
$tellraw @s {"text":"$(text)","color":"$(color)","italic":false}
