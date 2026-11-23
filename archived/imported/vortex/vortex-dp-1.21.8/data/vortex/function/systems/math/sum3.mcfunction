# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/math/sum3
# Adds three integers with INT_MAX overflow guard.
#  Input : $(a), $(b), $(c)
# Output: vortex:output result → a + b + c (clamped to 2147483647)
#
# Example:
# data modify storage vortex:input a set value 100
# data modify storage vortex:input b set value 200
# data modify storage vortex:input c set value 300
# function vortex:systems/math/sum3 with storage vortex:input {}
# vortex:output result = 600
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{math:0b} run return 0
$scoreboard players set $s3_a vortex.tmp $(a)
$scoreboard players set $s3_b vortex.tmp $(b)
$scoreboard players set $s3_c vortex.tmp $(c)

scoreboard players operation $s3_a vortex.tmp += $s3_b vortex.tmp
# Overflow clamp after first add
execute if score $s3_a vortex.tmp matches 2147483647.. run scoreboard players set $s3_a vortex.tmp 2147483647

scoreboard players operation $s3_a vortex.tmp += $s3_c vortex.tmp
# Overflow clamp after second add
execute if score $s3_a vortex.tmp matches 2147483647.. run scoreboard players set $s3_a vortex.tmp 2147483647

execute store result storage vortex:output result int 1 run scoreboard players get $s3_a vortex.tmp
