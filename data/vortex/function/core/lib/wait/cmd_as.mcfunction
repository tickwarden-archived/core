# vortex:core/lib/wait/cmd_as [MACRO]
$data modify storage vortex:engine queue append value {cmd:"$(cmd)", delay:$(delay), player:"$(player)"}
