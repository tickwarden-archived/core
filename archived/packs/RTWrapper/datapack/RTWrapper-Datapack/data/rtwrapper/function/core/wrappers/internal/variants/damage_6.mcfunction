# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_95ed379a2f:lifecycle {phase:1} run return 0
# RTWrapper generated 6-parameter macro variant for /damage.
# Parameters: target, amount, damage_type, location_or_by, source, cause
$damage $(target) $(amount) $(damage_type) $(location_or_by) $(source) $(cause)
