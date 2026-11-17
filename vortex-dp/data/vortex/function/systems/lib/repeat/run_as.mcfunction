# vortex:systems/lib/repeat/run_as [MACRO]
$data modify storage vortex:engine queue append value {func:"$(func)", delay:$(interval), player:"$(player)"}
