# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/text/_deny_probe [MACRO]
$execute if data storage vortex:text_map $(t)."$(c)" run scoreboard players set #tx_hit vortex.tmp 1
