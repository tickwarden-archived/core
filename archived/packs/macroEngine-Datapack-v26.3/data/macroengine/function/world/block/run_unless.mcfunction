# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:world/block/run_unless [MACRO]
$execute unless block $(x) $(y) $(z) $(block) run $(invoke)
