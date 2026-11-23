# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/core/lib/schedule/requeue_as [MACRO]
$data modify storage macroengine:engine queue append value {func:"$(func)", delay:$(interval), player:"$(player)"}
