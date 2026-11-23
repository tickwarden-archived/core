# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/events/uro_check [MACRO]
$execute unless data storage vortex:engine _uro{func:"$(func)"} run function vortex:core/internal/events/uro_append with storage vortex:engine _uro
