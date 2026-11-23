# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/core/lib/schedule/reset_do_cmd [MACRO]
$data modify storage macroengine:engine schedules.$(key).cmd set value "$(cmd)"
$data modify storage macroengine:engine schedules.$(key).interval set value $(interval)
$data modify storage macroengine:engine queue append value {cmd:"$(cmd)", delay:$(interval)}
