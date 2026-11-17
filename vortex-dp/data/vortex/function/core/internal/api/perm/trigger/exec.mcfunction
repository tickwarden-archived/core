# vortex:core/internal/api/perm/trigger/exec
execute if data storage vortex:engine _ptd_current.func run function vortex:core/internal/api/trigger/call with storage vortex:engine _ptd_current
execute if data storage vortex:engine _ptd_current.cmd run function vortex:core/internal/api/trigger/call2 with storage vortex:engine _ptd_current
