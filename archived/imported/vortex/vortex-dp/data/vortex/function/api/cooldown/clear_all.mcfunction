# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/cooldown/clear_all [MACRO]
$data remove storage vortex:engine cooldowns.$(player)
