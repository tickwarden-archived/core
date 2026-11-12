# vortex:player/reset [MACRO]
$data remove storage vortex:engine players.$(player)
$data remove storage vortex:engine cooldowns.$(player)
$advancement revoke @a[name=$(player),limit=1] from vortex:hidden/root
$data modify storage vortex:engine _pid_init_tmp set value {player:"$(player)"}
function vortex:player/init with storage vortex:engine _pid_init_tmp
