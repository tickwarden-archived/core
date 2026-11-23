# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_1f44a31786:lifecycle {phase:1} run return 0
# RTWrapper generated 6-parameter macro variant for /spreadplayers.
# Parameters: center, spread_distance, max_range, height_mode, respect_teams, targets
$spreadplayers $(center) $(spread_distance) $(max_range) $(height_mode) $(respect_teams) $(targets)
