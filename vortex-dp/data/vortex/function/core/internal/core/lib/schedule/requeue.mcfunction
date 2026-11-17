# vortex:core/internal/core/lib/schedule/requeue [MACRO]
$data modify storage vortex:engine queue append value {func:"$(func)", delay:$(interval)}
