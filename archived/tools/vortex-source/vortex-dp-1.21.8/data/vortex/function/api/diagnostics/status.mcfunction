# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/diagnostics/status
# Machine-readable health check. Runs systems/diagnostics/collect and returns the number of issues
# (0 = healthy). Prints nothing. Full result: vortex:output diagnostics (see docs/diagnostics.md).
# Read-only: it never enables a module, changes config or touches permissions.
#
# Usage:
#   execute store result score #x my.tmp run function vortex:api/diagnostics/status
#   data get storage vortex:output diagnostics.issues
#
# Caller: a player needs the vortex.admin tag; a non-player caller (console, other datapack) is allowed.

execute if entity @s[type=minecraft:player] unless entity @s[tag=vortex.admin] run return 0

return run function vortex:systems/diagnostics/collect
