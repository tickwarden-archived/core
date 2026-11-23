# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/flag/set [MACRO]
$data modify storage vortex:engine flags.$(key) set value 1b
