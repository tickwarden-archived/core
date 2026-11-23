# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ======================================================================================
# vortex:world/weather
# Reads the current weather at the executor's position, using the pack's own predicates.
#
# OUTPUT vortex:output weather: "clear" | "rain" | "thunder"
# RETURN 0 = clear, 1 = rain, 2 = thunder
#
# Weather is per dimension on a server with several dimensions, so run it as/at the
# entity whose dimension you care about.
#
# Usage:
#   execute as @a[limit=1] at @s run function vortex:world/weather
# ======================================================================================

execute if predicate vortex:is_thundering run data modify storage vortex:output weather set value "thunder"
execute if predicate vortex:is_thundering run return 2
execute if predicate vortex:is_raining run data modify storage vortex:output weather set value "rain"
execute if predicate vortex:is_raining run return 1
data modify storage vortex:output weather set value "clear"
return 0
