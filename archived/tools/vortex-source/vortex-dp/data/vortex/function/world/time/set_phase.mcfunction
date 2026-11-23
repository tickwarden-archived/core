# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ======================================================================================
# vortex:world/time/set_phase
# Sets the time of day from a phase name. Counterpart of world/time/phase.
#
# INPUT  (storage vortex:input world):
#   phase   "dawn" | "day" | "noon" | "dusk" | "night" | "midnight"
# OUTPUT vortex:output ok (1b when the time was set, 0b for an unknown phase)
# RETURN 1 when set, 0 for missing or unknown input.
#
# Times match the ranges in world/time/phase, so setting a phase and then reading it
# back returns the same name:
#   dawn 0, day 1000, noon 6000, dusk 12000, night 13800, midnight 18000
#
# Nothing from storage is pasted into a command: the phase is only compared with
# `if data`, so it needs no validation.
#
# Usage:
#   data modify storage vortex:input world set value {phase:"night"}
#   function vortex:world/time/set_phase
# ======================================================================================

data modify storage vortex:output ok set value 0b
execute unless data storage vortex:input world.phase run return 0

execute if data storage vortex:input world{phase:"dawn"} run time set 0
execute if data storage vortex:input world{phase:"dawn"} run data modify storage vortex:output ok set value 1b
execute if data storage vortex:input world{phase:"day"} run time set 1000
execute if data storage vortex:input world{phase:"day"} run data modify storage vortex:output ok set value 1b
execute if data storage vortex:input world{phase:"noon"} run time set 6000
execute if data storage vortex:input world{phase:"noon"} run data modify storage vortex:output ok set value 1b
execute if data storage vortex:input world{phase:"dusk"} run time set 12000
execute if data storage vortex:input world{phase:"dusk"} run data modify storage vortex:output ok set value 1b
execute if data storage vortex:input world{phase:"night"} run time set 13800
execute if data storage vortex:input world{phase:"night"} run data modify storage vortex:output ok set value 1b
execute if data storage vortex:input world{phase:"midnight"} run time set 18000
execute if data storage vortex:input world{phase:"midnight"} run data modify storage vortex:output ok set value 1b

execute if data storage vortex:output {ok:1b} run return 1
return 0
