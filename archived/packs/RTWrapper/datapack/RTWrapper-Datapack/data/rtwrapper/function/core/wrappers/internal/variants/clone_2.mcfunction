# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_95ed379a2f:lifecycle {phase:1} run return 0
# RTWrapper generated 2-parameter macro variant for /clone.
# Parameters: begin, end
$clone $(begin) $(end)
