# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────
# macroengine:core/lib/schedule/cmd
# Repeating command scheduler at a fixed interval.
#
# Input (macroengine:input):
# key — scheduler name (unique identifier)
# cmd — raw command to run on each trigger
# interval — repeat interval in ticks
# ─────────────────────────────────────────────

$execute if data storage macroengine:engine schedules.$(key) run data remove storage macroengine:engine schedules.$(key)

$data modify storage macroengine:engine schedules.$(key).cmd set value "$(cmd)"
$data modify storage macroengine:engine schedules.$(key).interval set value $(interval)
$data modify storage macroengine:engine queue append value {cmd:"$(cmd)", delay:$(interval)}
