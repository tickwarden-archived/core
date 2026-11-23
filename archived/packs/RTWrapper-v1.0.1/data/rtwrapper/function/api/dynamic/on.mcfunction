# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_1f44a31786:lifecycle {phase:1} run return 0
scoreboard players set #dynamic rtw.config 1
data modify storage rtwrapper:runtime config.dynamic set value 1b
tellraw @s [{"text":"[RTWrapper] dynamic command dispatch ON - storage requests can now run wrapped commands","color":"gold"}]
