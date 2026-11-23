# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_1f44a31786:lifecycle {phase:1} run return 0
# RTWrapper generated 5-parameter macro variant for /clone.
# Parameters: begin, end, destination, mask_mode, clone_mode
$clone $(begin) $(end) $(destination) $(mask_mode) $(clone_mode)
