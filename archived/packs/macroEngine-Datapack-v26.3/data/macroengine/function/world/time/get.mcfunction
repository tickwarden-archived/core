# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:world/time/get — 26.3 World Clocks
execute store result storage macroengine:output daytime int 1 run time query minecraft:day
execute store result storage macroengine:output total int 1 run time query gametime
execute store result storage macroengine:output day int 1 run time query minecraft:day repetition
