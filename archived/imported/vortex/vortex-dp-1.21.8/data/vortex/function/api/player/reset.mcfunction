# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/player/reset [MACRO]
$data remove storage vortex:engine players.$(player)
$data remove storage vortex:engine cooldowns.$(player)
$advancement revoke @a[name=$(player),limit=1] from vortex:hidden/root
$data modify storage vortex:engine _pid_init_tmp set value {player:"$(player)"}
function vortex:api/player/init with storage vortex:engine _pid_init_tmp
