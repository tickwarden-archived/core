# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/lib/queue/add_as [MACRO]
$data modify storage vortex:engine queue append value {func:"$(func)", delay:$(delay), player:"$(player)"}
