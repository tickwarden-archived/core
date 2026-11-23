# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/lib/schedule/reset [MACRO]
$execute unless data storage vortex:engine schedules.$(key) run return 0

$data modify storage vortex:engine _sreset set from storage vortex:engine schedules.$(key)
$data modify storage vortex:engine _sreset.key set value "$(key)"

$data remove storage vortex:engine schedules.$(key)

execute if data storage vortex:engine _sreset.func if data storage vortex:engine _sreset.player run function vortex:core/internal/core/lib/schedule/reset_do_as with storage vortex:engine _sreset
execute if data storage vortex:engine _sreset.func unless data storage vortex:engine _sreset.player run function vortex:core/internal/core/lib/schedule/reset_do with storage vortex:engine _sreset
execute if data storage vortex:engine _sreset.cmd if data storage vortex:engine _sreset.player run function vortex:core/internal/core/lib/schedule/reset_do_cmd_as with storage vortex:engine _sreset
execute if data storage vortex:engine _sreset.cmd unless data storage vortex:engine _sreset.player run function vortex:core/internal/core/lib/schedule/reset_do_cmd with storage vortex:engine _sreset
data remove storage vortex:engine _sreset
