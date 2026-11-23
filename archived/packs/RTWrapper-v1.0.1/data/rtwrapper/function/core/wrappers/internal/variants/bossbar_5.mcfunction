# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_1f44a31786:lifecycle {phase:1} run return 0
# RTWrapper generated 5-parameter macro variant for /bossbar.
# Parameters: action, id, name, property, value
$bossbar $(action) $(id) $(name) $(property) $(value)
