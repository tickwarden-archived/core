# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:events/fire_queued [MACRO]
$execute unless data storage vortex:engine events.$(event) run return 0

$data modify storage vortex:engine queue append value {func:"vortex:core/internal/events/fire_deferred", delay:$(delay), event:"$(event)"}
