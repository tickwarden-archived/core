# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/math/log2_loop
execute if score $lg2_v vortex.tmp matches ..1 run return 0

scoreboard players add $lg2_r vortex.tmp 1
scoreboard players operation $lg2_v vortex.tmp /= $lg2_2 vortex.tmp

function vortex:core/internal/systems/math/log2_loop
