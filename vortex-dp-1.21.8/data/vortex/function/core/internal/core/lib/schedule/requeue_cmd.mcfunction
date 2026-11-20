# vortex:core/internal/core/lib/schedule/requeue_cmd [MACRO]
$data modify storage vortex:engine queue append value {cmd:"$(cmd)", delay:$(interval)}
