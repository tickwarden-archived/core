# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_95ed379a2f:lifecycle {phase:1} run return 0
tag @s remove rtwrapper.debug
tellraw @s [{"text":"[RTWrapper] debug listener removed","color":"gold"}]
