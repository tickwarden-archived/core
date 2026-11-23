# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/math/ratio_percent [MACRO]
# Computes what percent part is of total (integer, rounds toward zero).
#  Input : $(part), $(total) — keep |part| ≤ 21474836; total 0 yields 0
# Output: vortex:output result → int
#
# Example: function vortex:systems/math/ratio_percent {part:3,total:12}  → 25
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{math:0b} run return 0
$scoreboard players set $rp_a vortex.tmp $(part)
$scoreboard players set $rp_b vortex.tmp $(total)
execute if score $rp_b vortex.tmp matches 0 run data modify storage vortex:output result set value 0
execute if score $rp_b vortex.tmp matches 0 run return 0
scoreboard players set $rp_100 vortex.tmp 100
scoreboard players operation $rp_a vortex.tmp *= $rp_100 vortex.tmp
scoreboard players operation $rp_a vortex.tmp /= $rp_b vortex.tmp
execute store result storage vortex:output result int 1 run scoreboard players get $rp_a vortex.tmp
scoreboard players reset $rp_a vortex.tmp
scoreboard players reset $rp_b vortex.tmp
scoreboard players reset $rp_100 vortex.tmp
