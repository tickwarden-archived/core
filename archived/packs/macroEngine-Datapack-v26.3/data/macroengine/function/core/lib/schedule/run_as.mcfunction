# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/lib/schedule/run_as [MACRO]
$execute if data storage macroengine:engine schedules.$(key) run data remove storage macroengine:engine schedules.$(key)

$data modify storage macroengine:engine schedules.$(key).func set value "$(func)"
$data modify storage macroengine:engine schedules.$(key).interval set value $(interval)
$data modify storage macroengine:engine schedules.$(key).player set value "$(player)"
$data modify storage macroengine:engine queue append value {func:"$(func)", delay:$(interval), player:"$(player)"}
