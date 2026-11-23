# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_1f44a31786:lifecycle {phase:1} run return 0
# RTWrapper generated 4-parameter macro variant for /attribute.
# Parameters: target, attribute, action, value
$attribute $(target) $(attribute) $(action) $(value)
