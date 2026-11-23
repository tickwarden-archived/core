# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_1f44a31786:lifecycle {phase:1} run return 0
# RTWrapper generated 10-parameter macro variant for /item.
# Parameters: action, target_kind, target, slot, modifier, source_kind, source, source_slot, item, count
$item $(action) $(target_kind) $(target) $(slot) $(modifier) $(source_kind) $(source) $(source_slot) $(item) $(count)
