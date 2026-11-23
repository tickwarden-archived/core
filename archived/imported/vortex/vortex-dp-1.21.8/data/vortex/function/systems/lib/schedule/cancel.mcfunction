# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/lib/schedule/cancel [MACRO]
$data remove storage vortex:engine schedules.$(key)
