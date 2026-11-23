# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_1f44a31786:lifecycle {phase:1} run return 0
tag @s add rtwrapper.debug
tellraw @s [{"text":"[RTWrapper] you will receive debug messages","color":"gold"}]
