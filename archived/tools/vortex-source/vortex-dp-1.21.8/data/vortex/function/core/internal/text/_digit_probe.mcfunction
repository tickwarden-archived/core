# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/text/_digit_probe [MACRO]
$execute if data storage vortex:text_map digit."$(c)" run data modify storage vortex:text isd set value 1b
