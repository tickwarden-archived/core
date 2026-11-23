# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/text/_deny_probe [MACRO]
$execute if data storage macroengine:text_map $(t)."$(c)" run scoreboard players set #tx_hit macroengine.tmp 1
