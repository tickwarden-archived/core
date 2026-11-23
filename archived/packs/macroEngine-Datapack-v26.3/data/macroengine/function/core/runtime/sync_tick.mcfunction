# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/runtime/sync_tick
execute store result storage macroengine:engine global.tick int 1 run scoreboard players get $tick macroengine.tmp
execute store result storage macroengine:engine global.epoch int 1 run scoreboard players get $epoch macroengine.time
scoreboard players set $tick macroengine.tmp 0
