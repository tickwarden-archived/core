# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ======================================================================================
# vortex:world/weather/set
# Sets the weather. Counterpart of world/weather, which reads it.
#
# INPUT  (storage vortex:input world):
#   weather   "clear" | "rain" | "thunder"
#   duration  optional, ticks, clamped to 1..1000000. Must be a real NBT number.
#             Left out: vanilla picks its own duration.
# OUTPUT vortex:output ok (1b when the weather was set, 0b for an unknown value)
# RETURN 1 when set, 0 for missing or unknown input.
#
# The weather name is checked against the three allowed values with `if data` before it
# reaches the macro line, and the duration is turned into an int through a scoreboard,
# so nothing else from storage is ever pasted into a command.
#
# Usage:
#   data modify storage vortex:input world set value {weather:"rain",duration:6000}
#   function vortex:world/weather/set
# ======================================================================================

data modify storage vortex:output ok set value 0b
execute unless data storage vortex:input world.weather run return 0
execute unless data storage vortex:input world{weather:"clear"} unless data storage vortex:input world{weather:"rain"} unless data storage vortex:input world{weather:"thunder"} run return 0

# No duration: let vanilla choose.
execute unless data storage vortex:input world.duration run function vortex:core/internal/ext/world/weather_set_default
execute unless data storage vortex:input world.duration run return run data get storage vortex:output ok

execute store result score #ext_ws_d vortex.tmp run data get storage vortex:input world.duration
execute if score #ext_ws_d vortex.tmp matches ..0 run scoreboard players set #ext_ws_d vortex.tmp 1
execute if score #ext_ws_d vortex.tmp matches 1000001.. run scoreboard players set #ext_ws_d vortex.tmp 1000000
data modify storage vortex:engine _ext_ws set value {}
data modify storage vortex:engine _ext_ws.weather set from storage vortex:input world.weather
execute store result storage vortex:engine _ext_ws.d int 1 run scoreboard players get #ext_ws_d vortex.tmp
function vortex:core/internal/ext/world/weather_set with storage vortex:engine _ext_ws
data remove storage vortex:engine _ext_ws
return run data get storage vortex:output ok
