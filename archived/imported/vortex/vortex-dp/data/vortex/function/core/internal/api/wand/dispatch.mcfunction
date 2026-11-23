# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/wand/dispatch
# Called as @s. Compare held items with the bind list.

data modify storage vortex:engine _wand_iter set from storage vortex:engine wand_binds
execute if data storage vortex:engine _wand_iter[0] run function vortex:core/internal/api/wand/check_next
data remove storage vortex:engine _wand_iter
data remove storage vortex:engine _wand_current
