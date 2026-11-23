# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:world/block/run_if [MACRO]
$execute if block $(x) $(y) $(z) $(block) run $(invoke)
