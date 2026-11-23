# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/core/lib/schedule/reset_do_cmd_as [MACRO]
$data modify storage vortex:engine schedules.$(key).cmd set value "$(cmd)"
$data modify storage vortex:engine schedules.$(key).interval set value $(interval)
$data modify storage vortex:engine schedules.$(key).player set value "$(player)"
$data modify storage vortex:engine queue append value {cmd:"$(cmd)", delay:$(interval), player:"$(player)"}
