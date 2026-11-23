# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_95ed379a2f:lifecycle {phase:1} run return 0
# RTWrapper generated 6-parameter macro variant for /item.
# Parameters: action, target_kind, target, slot, modifier, source_kind
$item $(action) $(target_kind) $(target) $(slot) $(modifier) $(source_kind)
