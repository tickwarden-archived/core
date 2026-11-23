# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/container/slot_set_do [INTERNAL]
data modify storage vortex:output container set value {ok:0b}
execute unless data storage vortex:input item.id run return 0
execute unless data storage vortex:input slot run return 0
execute unless function vortex:core/internal/api/container/_addr run return 0
data modify storage vortex:container tmp.item set from storage vortex:input item
execute unless data storage vortex:container tmp.item.count run data modify storage vortex:container tmp.item.count set value 1
execute store result score #ct_c vortex.tmp run data get storage vortex:container tmp.item.count
execute unless score #ct_c vortex.tmp matches 1..99 run return 0
execute store result storage vortex:container tmp.item.count int 1 run scoreboard players get #ct_c vortex.tmp
execute store result storage vortex:container tmp.item.Slot byte 1 run data get storage vortex:container tmp.k.slot
return run function vortex:core/internal/api/container/_slot_set_m with storage vortex:container tmp.k
