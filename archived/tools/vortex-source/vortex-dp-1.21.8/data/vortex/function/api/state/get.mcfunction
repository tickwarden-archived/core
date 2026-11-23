# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/state/get [MACRO]
data remove storage vortex:output result
$execute if data storage vortex:engine states.$(player) run data modify storage vortex:output result set from storage vortex:engine states.$(player)
