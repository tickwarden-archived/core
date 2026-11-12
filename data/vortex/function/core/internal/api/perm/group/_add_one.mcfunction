# vortex:core/internal/api/perm/group/_add_one [INTERNAL - macro]
# INPUT: $(value) - a permission name that passed safe_name in _apply_loop.

$execute as @a if score @s vortex.pid = $grp_pid vortex.tmp run tag @s add perm.$(value)
