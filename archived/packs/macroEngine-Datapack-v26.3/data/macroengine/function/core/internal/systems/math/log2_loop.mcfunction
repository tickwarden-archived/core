# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/systems/math/log2_loop
execute if score $lg2_v macroengine.tmp matches ..1 run return 0

scoreboard players add $lg2_r macroengine.tmp 1
scoreboard players operation $lg2_v macroengine.tmp /= $lg2_2 macroengine.tmp

function macroengine:core/internal/systems/math/log2_loop
