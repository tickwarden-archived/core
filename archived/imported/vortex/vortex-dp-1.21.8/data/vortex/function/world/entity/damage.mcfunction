# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:world/entity/damage [MACRO]
$damage @e[type=$(type),tag=$(tag)] $(amount) $(damage_type)
