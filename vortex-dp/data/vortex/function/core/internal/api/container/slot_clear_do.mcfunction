# vortex:core/internal/api/container/slot_clear_do [INTERNAL]
# Body of api/container/slot_clear.
data modify storage vortex:output container set value {ok:0b}
execute unless data storage vortex:input slot run return 0
execute unless function vortex:core/internal/api/container/_addr run return 0
return run function vortex:core/internal/api/container/_slot_clear_m with storage vortex:container tmp.k
