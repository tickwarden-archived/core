# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/runtime/sync_tick
execute store result storage vortex:engine global.tick int 1 run scoreboard players get $tick vortex.tmp
execute store result storage vortex:engine global.epoch int 1 run scoreboard players get $epoch vortex.time
scoreboard players set $tick vortex.tmp 0
