# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_1f44a31786:lifecycle {phase:1} run return 0
scoreboard players set #auto_tick rtw.config 0
data modify storage rtwrapper:runtime config.auto_tick set value 0b
tellraw @s [{"text":"[RTWrapper] auto tick off","color":"gold"}]
