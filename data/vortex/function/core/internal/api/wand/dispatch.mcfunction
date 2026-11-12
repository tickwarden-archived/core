# vortex:api/wand/internal/dispatch
# Called as @s. Compare held items with the bind list.

data modify storage vortex:engine _wand_iter set from storage vortex:engine wand_binds
execute if data storage vortex:engine _wand_iter[0] run function vortex:core/internal/api/wand/check_next
data remove storage vortex:engine _wand_iter
data remove storage vortex:engine _wand_current
