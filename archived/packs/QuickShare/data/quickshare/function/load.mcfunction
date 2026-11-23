# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_67654ba1d3:lifecycle {phase:1} run return 0
# QuickShare - runs once on datapack (re)load
scoreboard objectives add qs_cooldown dummy
tellraw @a {"text":"[QuickShare] loaded.","color":"gray"}
