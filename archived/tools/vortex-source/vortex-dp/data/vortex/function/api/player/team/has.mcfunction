# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/player/team/has [MACRO]
data modify storage vortex:output result set value 0b
$execute if entity @a[name=$(player),team=$(team)] run data modify storage vortex:output result set value 1b
