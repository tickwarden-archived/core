# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/core/lib/queue/add_cmd [MACRO]
$data modify storage vortex:engine queue append value {cmd:"$(cmd)", delay:$(delay)}
