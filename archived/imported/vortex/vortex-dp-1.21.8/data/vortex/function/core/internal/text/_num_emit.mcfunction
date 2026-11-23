# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/text/_num_emit [MACRO]
# INPUT $(s): a string already validated by num_check (digits, one '-', one '.').
$data modify storage vortex:text out set value $(s)
