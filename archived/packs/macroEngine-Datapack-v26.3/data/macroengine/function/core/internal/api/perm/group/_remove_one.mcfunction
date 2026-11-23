# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/api/perm/group/_remove_one [INTERNAL - macro]
# INPUT: $(value) - a permission name that passed safe_name in _apply_loop.

$execute as @a if score @s macroengine.pid = $grp_pid macroengine.tmp run tag @s remove perm.$(value)
