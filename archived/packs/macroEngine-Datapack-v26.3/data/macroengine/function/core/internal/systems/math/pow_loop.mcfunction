# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/systems/math/pow_loop
execute if score $pow_n macroengine.tmp matches ..0 run return 0
scoreboard players operation $pow_r macroengine.tmp *= $pow_a macroengine.tmp
scoreboard players remove $pow_n macroengine.tmp 1
function macroengine:core/internal/systems/math/pow_loop
