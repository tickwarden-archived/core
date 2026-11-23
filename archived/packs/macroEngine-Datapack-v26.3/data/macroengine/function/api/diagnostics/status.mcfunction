# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:api/diagnostics/status
# Machine-readable health check. Runs systems/diagnostics/collect and returns the number of issues
# (0 = healthy). Prints nothing. Full result: macroengine:output diagnostics (see docs/diagnostics.md).
# Read-only: it never enables a module, changes config or touches permissions.
#
# Usage:
#   execute store result score #x my.tmp run function macroengine:api/diagnostics/status
#   data get storage macroengine:output diagnostics.issues
#
# Caller: a player needs the macroengine.admin tag; a non-player caller (console, other datapack) is allowed.

execute if entity @s[type=minecraft:player] unless entity @s[tag=macroengine.admin] run return 0

return run function macroengine:systems/diagnostics/collect
