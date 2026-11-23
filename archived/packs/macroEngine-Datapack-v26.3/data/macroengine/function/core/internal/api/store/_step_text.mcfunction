# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/api/store/_step_text [INTERNAL]
execute store result score #st_len macroengine.tmp run data get storage macroengine:store tmp.segs[0]
execute if score #st_len macroengine.tmp matches 1.. run data modify storage macroengine:store tmp.frags append from storage macroengine:store tmp.segs[0]
data remove storage macroengine:store tmp.segs[0]
scoreboard players set #st_mode macroengine.tmp 1
