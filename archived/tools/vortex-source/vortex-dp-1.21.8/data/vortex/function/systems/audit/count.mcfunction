# vortex:systems/audit/count
# Number of stored audit entries (0..100).
# Output: vortex:output result (int) and the function return value.
#
# Usage:  function vortex:systems/audit/count

execute if data storage vortex:engine modules{audit:0b} run return 0
execute store result score #vortex.au_c vortex.tmp run data get storage vortex:audit entries
execute store result storage vortex:output result int 1 run scoreboard players get #vortex.au_c vortex.tmp
return run scoreboard players get #vortex.au_c vortex.tmp
