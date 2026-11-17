# ======================================================================================
# vortex:core/internal/ext/world/weather_set_default [INTERNAL]
# Sets the weather from vortex:input world.weather with a vanilla-chosen duration.
# world/weather/set has already checked that the value is clear, rain or thunder.
# ======================================================================================

execute if data storage vortex:input world{weather:"clear"} run weather clear
execute if data storage vortex:input world{weather:"rain"} run weather rain
execute if data storage vortex:input world{weather:"thunder"} run weather thunder
data modify storage vortex:output ok set value 1b
