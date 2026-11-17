# vortex:core/internal/api/store/_all_one [INTERNAL]
# Runs as one player: renders the current in.* and appends {uuid, string} to all.entries.
execute unless function vortex:api/store/render run return 0
data modify storage vortex:store all.entries append value {}
data modify storage vortex:store all.entries[-1].uuid set from entity @s UUID
data modify storage vortex:store all.entries[-1].string set from storage vortex:store out.string
