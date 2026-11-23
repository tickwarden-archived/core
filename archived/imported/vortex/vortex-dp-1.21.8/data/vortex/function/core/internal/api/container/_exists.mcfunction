# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/container/_exists [INTERNAL, MACRO: x, y, z]
# RETURN 1 when the block is a container (has an Items list), else 0.
$execute if data block $(x) $(y) $(z) Items run return 1
return 0
