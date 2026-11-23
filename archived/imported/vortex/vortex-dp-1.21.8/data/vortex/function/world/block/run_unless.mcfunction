# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:world/block/run_unless [MACRO]
$execute unless block $(x) $(y) $(z) $(block) run $(invoke)
