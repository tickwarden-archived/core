# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/api/perm/trigger/exec
execute if data storage macroengine:engine _ptd_current.func run function macroengine:core/internal/api/trigger/call with storage macroengine:engine _ptd_current
execute if data storage macroengine:engine _ptd_current.cmd run function macroengine:core/internal/api/trigger/call2 with storage macroengine:engine _ptd_current
