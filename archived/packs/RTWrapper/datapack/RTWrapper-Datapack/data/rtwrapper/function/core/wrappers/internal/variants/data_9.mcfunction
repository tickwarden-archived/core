# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_95ed379a2f:lifecycle {phase:1} run return 0
# RTWrapper generated 9-parameter macro variant for /data.
# Parameters: action, target_kind, target, path, operation, source_kind, source, source_path, value
$data $(action) $(target_kind) $(target) $(path) $(operation) $(source_kind) $(source) $(source_path) $(value)
