# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ======================================================================================
# vortex:systems/math/median3 [MACRO]
# Median (middle value) of three integers. Uses compare-and-swap, so there is no
# overflow risk like a (a + b + c - min - max) formula would have.
#
# INPUT:  $(a), $(b), $(c)  integers
# OUTPUT: vortex:output result
#
# Example: function vortex:systems/math/median3 {a:9,b:2,c:5}  -> result = 5
# ======================================================================================

execute if data storage vortex:engine modules{math:0b} run return 0
$scoreboard players set #ext_m_a vortex.tmp $(a)
$scoreboard players set #ext_m_b vortex.tmp $(b)
$scoreboard players set #ext_m_c vortex.tmp $(c)
execute if score #ext_m_a vortex.tmp > #ext_m_b vortex.tmp run scoreboard players operation #ext_m_a vortex.tmp >< #ext_m_b vortex.tmp
execute if score #ext_m_b vortex.tmp > #ext_m_c vortex.tmp run scoreboard players operation #ext_m_b vortex.tmp >< #ext_m_c vortex.tmp
execute if score #ext_m_a vortex.tmp > #ext_m_b vortex.tmp run scoreboard players operation #ext_m_a vortex.tmp >< #ext_m_b vortex.tmp
execute store result storage vortex:output result int 1 run scoreboard players get #ext_m_b vortex.tmp
