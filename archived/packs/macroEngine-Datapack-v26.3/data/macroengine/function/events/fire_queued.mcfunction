# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:events/fire_queued [MACRO]
$execute unless data storage macroengine:engine events.$(event) run return 0

$data modify storage macroengine:engine queue append value {func:"macroengine:core/internal/events/fire_deferred", delay:$(delay), event:"$(event)"}
