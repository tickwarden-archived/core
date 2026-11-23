# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_1f44a31786:lifecycle {phase:1} run return 0
# RTWrapper generated 7-parameter macro variant for /data.
# Parameters: action, target_kind, target, path, operation, source_kind, source
$data $(action) $(target_kind) $(target) $(path) $(operation) $(source_kind) $(source)
