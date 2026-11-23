# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:events/count [MACRO]
data modify storage vortex:output result set value 0
$execute if data storage vortex:engine events.$(event) run execute store result storage vortex:output result int 1 run data get storage vortex:engine events.$(event)
