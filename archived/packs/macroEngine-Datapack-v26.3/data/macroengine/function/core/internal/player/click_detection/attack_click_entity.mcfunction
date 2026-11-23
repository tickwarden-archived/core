# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/player/click_detection/attack_click_entity
advancement revoke @s only macroengine:core/internal/player/attack_click_entity
function #macroengine:core/internal/player/left_click
