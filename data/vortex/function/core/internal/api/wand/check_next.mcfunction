# vortex:api/wand/internal/check_next
# Iterate bind list: match the tag of the held item.

execute unless data storage vortex:engine _wand_iter[0] run return 0

data modify storage vortex:engine _wand_current set from storage vortex:engine _wand_iter[0]
data remove storage vortex:engine _wand_iter[0]

function vortex:core/internal/api/wand/check_item with storage vortex:engine _wand_current

function vortex:core/internal/api/wand/check_next
