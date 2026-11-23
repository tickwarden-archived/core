# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/core/lib/schedule/requeue [MACRO]
$data modify storage vortex:engine queue append value {func:"$(func)", delay:$(interval)}
