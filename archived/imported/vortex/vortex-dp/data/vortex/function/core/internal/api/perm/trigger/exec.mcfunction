# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/perm/trigger/exec
execute if data storage vortex:engine _ptd_current.func run function vortex:core/internal/api/trigger/call with storage vortex:engine _ptd_current
execute if data storage vortex:engine _ptd_current.cmd run function vortex:core/internal/api/trigger/call2 with storage vortex:engine _ptd_current
