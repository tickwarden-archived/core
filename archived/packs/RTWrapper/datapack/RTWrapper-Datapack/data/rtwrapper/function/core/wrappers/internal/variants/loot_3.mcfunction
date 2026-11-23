# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_95ed379a2f:lifecycle {phase:1} run return 0
# RTWrapper generated 3-parameter macro variant for /loot.
# Parameters: action, target, target_slot
$loot $(action) $(target) $(target_slot)
