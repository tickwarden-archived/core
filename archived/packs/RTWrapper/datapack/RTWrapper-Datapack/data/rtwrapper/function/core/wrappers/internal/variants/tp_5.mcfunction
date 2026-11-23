# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_95ed379a2f:lifecycle {phase:1} run return 0
# RTWrapper generated 5-parameter macro variant for /tp.
# Parameters: target, x, y, z, rotation
$tp $(target) $(x) $(y) $(z) $(rotation)
