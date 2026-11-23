# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:world/entity/give_effect [MACRO]
$effect give @e[type=$(type),tag=$(tag)] $(effect) $(duration) $(amplifier) true
