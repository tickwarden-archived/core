# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/perm/group/_add_one [INTERNAL - macro]
# INPUT: $(value) - a permission name that passed safe_name in _apply_loop.

$execute as @a if score @s vortex.pid = $grp_pid vortex.tmp run tag @s add perm.$(value)
