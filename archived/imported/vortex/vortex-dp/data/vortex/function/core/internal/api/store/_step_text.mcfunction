# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/store/_step_text [INTERNAL]
execute store result score #st_len vortex.tmp run data get storage vortex:store tmp.segs[0]
execute if score #st_len vortex.tmp matches 1.. run data modify storage vortex:store tmp.frags append from storage vortex:store tmp.segs[0]
data remove storage vortex:store tmp.segs[0]
scoreboard players set #st_mode vortex.tmp 1
