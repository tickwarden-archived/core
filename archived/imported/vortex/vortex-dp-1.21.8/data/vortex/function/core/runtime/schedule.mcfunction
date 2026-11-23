# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/runtime/schedule [MACRO]
$execute if data storage vortex:engine schedules.$(key) run data remove storage vortex:engine schedules.$(key)

$data modify storage vortex:engine schedules.$(key).func set value "$(func)"
$data modify storage vortex:engine schedules.$(key).interval set value $(interval)
$data modify storage vortex:engine queue append value {func:"$(func)", delay:$(interval)}
