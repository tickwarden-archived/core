# vortex:systems/lib/queue/add_as [MACRO]
$data modify storage vortex:engine queue append value {func:"$(func)", delay:$(delay), player:"$(player)"}
