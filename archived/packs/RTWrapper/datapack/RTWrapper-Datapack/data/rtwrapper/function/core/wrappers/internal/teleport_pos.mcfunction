# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_95ed379a2f:lifecycle {phase:1} run return 0
# Convenience macro wrapper for: /teleport <targets> <x> <y> <z>
# Required storage keys: targets, x, y, z.
$teleport $(targets) $(x) $(y) $(z)
