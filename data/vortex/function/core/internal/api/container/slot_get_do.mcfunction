# vortex:core/internal/api/container/slot_get_do [INTERNAL]
# Body of api/container/slot_get (no module gate, so api/block can reuse it).
data modify storage vortex:output container set value {ok:0b,empty:1b}
execute unless data storage vortex:input slot run return 0
execute unless function vortex:core/internal/api/container/_addr run return 0
return run function vortex:core/internal/api/container/_slot_get_m with storage vortex:container tmp.k
