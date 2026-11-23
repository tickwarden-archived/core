# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/condition_test [MACRO]
$execute if predicate $(predicate) run return 1
return 0
