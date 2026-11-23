# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/dialog/raw_show [MACRO]
# {dialog:<inline compound or trusted registry identifier>}; no route/session management.
$dialog show @s $(dialog)
