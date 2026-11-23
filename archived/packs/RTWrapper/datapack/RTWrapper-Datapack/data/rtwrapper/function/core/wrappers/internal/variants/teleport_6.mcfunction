# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_95ed379a2f:lifecycle {phase:1} run return 0
# RTWrapper generated 6-parameter macro variant for /teleport.
# Parameters: target, x, y, z, rotation, facing_mode
$teleport $(target) $(x) $(y) $(z) $(rotation) $(facing_mode)
