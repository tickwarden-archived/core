# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/trigger/disable [MACRO]
execute if data storage vortex:engine modules{trigger:0b} run return 0
$scoreboard players reset $(player) vortex.action
