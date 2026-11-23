# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/math/pow_loop
execute if score $pow_n vortex.tmp matches ..0 run return 0
scoreboard players operation $pow_r vortex.tmp *= $pow_a vortex.tmp
scoreboard players remove $pow_n vortex.tmp 1
function vortex:core/internal/systems/math/pow_loop
