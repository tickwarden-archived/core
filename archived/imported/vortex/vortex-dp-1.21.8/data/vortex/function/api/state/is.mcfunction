# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/state/is [MACRO]
data modify storage vortex:output result set value 0b
$execute if data storage vortex:engine states{$(player):"$(state)"} run data modify storage vortex:output result set value 1b
