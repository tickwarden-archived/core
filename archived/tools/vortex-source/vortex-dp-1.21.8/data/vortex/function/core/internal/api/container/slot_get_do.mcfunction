# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/container/slot_get_do [INTERNAL]
data modify storage vortex:output container set value {ok:0b,empty:1b}
execute unless data storage vortex:input slot run return 0
execute unless function vortex:core/internal/api/container/_addr run return 0
return run function vortex:core/internal/api/container/_slot_get_m with storage vortex:container tmp.k
