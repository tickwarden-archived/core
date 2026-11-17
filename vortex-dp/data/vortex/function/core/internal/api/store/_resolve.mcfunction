# vortex:core/internal/api/store/_resolve [INTERNAL]
# tmp.segs[0] is a name between two '%'. Appends exactly one entry to tmp.frags.
data modify storage vortex:store tmp.nm set from storage vortex:store tmp.segs[0]
data remove storage vortex:store tmp.val
data remove storage vortex:store tmp.raw
execute store result score #st_len vortex.tmp run data get storage vortex:store tmp.nm
execute if score #st_len vortex.tmp matches 0 run data modify storage vortex:store tmp.val set value "%"
execute unless data storage vortex:store tmp.val run function vortex:core/internal/api/store/_dispatch
execute if data storage vortex:store tmp.val run data modify storage vortex:store tmp.frags append from storage vortex:store tmp.val
execute if data storage vortex:store tmp.val run return 1
# unknown: keep "%name%" exactly as written
execute if data storage vortex:engine config{store_keep_unknown:0b} run return 1
data modify storage vortex:store tmp.frags append value "%"
data modify storage vortex:store tmp.frags append from storage vortex:store tmp.nm
data modify storage vortex:store tmp.frags append value "%"
