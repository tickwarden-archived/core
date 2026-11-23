# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/perm/trigger/clear [MACRO]
execute if data storage vortex:engine modules{perm:0b} run return 0
$data remove storage vortex:engine perm_triggers.$(name)
