# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/cooldown/clear_all [MACRO]
$data remove storage macroengine:engine cooldowns.$(player)
