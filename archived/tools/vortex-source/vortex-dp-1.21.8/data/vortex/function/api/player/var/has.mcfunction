# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/player/var/has [MACRO]
data modify storage vortex:output result set value 0b
$execute if data storage vortex:engine players.$(player).$(key) run data modify storage vortex:output result set value 1b
