# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/player/click_detection/attack_click_entity
advancement revoke @s only vortex:core/internal/player/attack_click_entity
function #vortex:core/internal/player/left_click
