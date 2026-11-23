# vortex:core/internal/api/store/_step_text [INTERNAL]
execute store result score #st_len vortex.tmp run data get storage vortex:store tmp.segs[0]
execute if score #st_len vortex.tmp matches 1.. run data modify storage vortex:store tmp.frags append from storage vortex:store tmp.segs[0]
data remove storage vortex:store tmp.segs[0]
scoreboard players set #st_mode vortex.tmp 1
