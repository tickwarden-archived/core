# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_95ed379a2f:lifecycle {phase:1} run return 0
scoreboard players set #silent rtw.config 0
data modify storage rtwrapper:runtime config.silent set value 0b
tellraw @s [{"text":"[RTWrapper] silent off","color":"gold"}]
