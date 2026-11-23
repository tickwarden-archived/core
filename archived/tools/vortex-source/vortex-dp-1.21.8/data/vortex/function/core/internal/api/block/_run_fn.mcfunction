# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/block/_run_fn [INTERNAL, MACRO: x, y, z, fn]
# x, y, z are ints from the position check, fn passed function_id at register time.
$return run execute positioned $(x) $(y) $(z) run function $(fn)
