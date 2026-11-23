# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_1f44a31786:lifecycle {phase:1} run return 0
scoreboard players set #auto_tick rtw.config 1
data modify storage rtwrapper:runtime config.auto_tick set value 1b
tellraw @s [{"text":"[RTWrapper] auto tick on","color":"gold"}]
