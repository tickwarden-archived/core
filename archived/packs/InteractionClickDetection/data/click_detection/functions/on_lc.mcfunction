# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_3b9a8e469f:lifecycle {phase:1} run return 0
advancement revoke @s only click_detection:lc
function #click_detection:on_lc
