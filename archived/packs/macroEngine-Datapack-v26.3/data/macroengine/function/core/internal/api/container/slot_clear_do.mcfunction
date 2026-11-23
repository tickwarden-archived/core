# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/api/container/slot_clear_do [INTERNAL]
# Body of api/container/slot_clear.
data modify storage macroengine:output container set value {ok:0b}
execute unless data storage macroengine:input slot run return 0
execute unless function macroengine:core/internal/api/container/_addr run return 0
return run function macroengine:core/internal/api/container/_slot_clear_m with storage macroengine:container tmp.k
