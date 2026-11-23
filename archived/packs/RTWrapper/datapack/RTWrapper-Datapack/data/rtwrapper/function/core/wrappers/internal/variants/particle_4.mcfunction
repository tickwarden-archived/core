# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_95ed379a2f:lifecycle {phase:1} run return 0
# RTWrapper generated 4-parameter macro variant for /particle.
# Parameters: particle, pos, delta, speed
$particle $(particle) $(pos) $(delta) $(speed)
