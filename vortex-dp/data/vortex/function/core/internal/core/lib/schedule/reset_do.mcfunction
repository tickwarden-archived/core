# vortex:core/internal/core/lib/schedule/reset_do [MACRO]
$data modify storage vortex:engine schedules.$(key).func set value "$(func)"
$data modify storage vortex:engine schedules.$(key).interval set value $(interval)
$data modify storage vortex:engine queue append value {func:"$(func)", delay:$(interval)}
