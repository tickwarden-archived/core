# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_95ed379a2f:lifecycle {phase:1} run return 0
tellraw @s [{"text":"[RTWrapper] processed=","color":"gold"},{"score":{"name":"#processed","objective":"rtw.status"},"color":"yellow"},{"text":" errors=","color":"gold"},{"score":{"name":"#errors","objective":"rtw.status"},"color":"red"}]
