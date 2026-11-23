# vortex:core/internal/core/lib/schedule/requeue_cmd_as [MACRO]
$data modify storage vortex:engine queue append value {cmd:"$(cmd)", delay:$(interval), player:"$(player)"}
