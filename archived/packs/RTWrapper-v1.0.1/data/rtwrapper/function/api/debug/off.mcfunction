# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_1f44a31786:lifecycle {phase:1} run return 0
scoreboard players set #debug rtw.config 0
data modify storage rtwrapper:runtime config.debug set value 0b
tellraw @s [{"text":"[RTWrapper] debug off","color":"gold"}]
