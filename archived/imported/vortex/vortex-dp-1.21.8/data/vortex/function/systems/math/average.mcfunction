# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/math/average
# Computes the integer average of up to 8 values.
#  Input : $(v0)..(v7)  → integer values
#          $(count)     → how many values (1-8)
# Output: vortex:output result → floor(sum / count)
#
# Example:
# data modify storage vortex:input v0 set value 10
# data modify storage vortex:input v1 set value 20
# data modify storage vortex:input v2 set value 30
# data modify storage vortex:input count set value 3
# function vortex:systems/math/average with storage vortex:input {}
# vortex:output result = 20
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{math:0b} run return 0
$scoreboard players set $avg_c vortex.tmp $(count)

execute if score $avg_c vortex.tmp matches ..0 run data modify storage vortex:output result set value 0
execute if score $avg_c vortex.tmp matches ..0 run return 0

$scoreboard players set $avg_s vortex.tmp $(v0)
$execute if score $avg_c vortex.tmp matches 2.. run scoreboard players add $avg_s vortex.tmp $(v1)
$execute if score $avg_c vortex.tmp matches 3.. run scoreboard players add $avg_s vortex.tmp $(v2)
$execute if score $avg_c vortex.tmp matches 4.. run scoreboard players add $avg_s vortex.tmp $(v3)
$execute if score $avg_c vortex.tmp matches 5.. run scoreboard players add $avg_s vortex.tmp $(v4)
$execute if score $avg_c vortex.tmp matches 6.. run scoreboard players add $avg_s vortex.tmp $(v5)
$execute if score $avg_c vortex.tmp matches 7.. run scoreboard players add $avg_s vortex.tmp $(v6)
$execute if score $avg_c vortex.tmp matches 8.. run scoreboard players add $avg_s vortex.tmp $(v7)

scoreboard players operation $avg_s vortex.tmp /= $avg_c vortex.tmp

execute store result storage vortex:output result int 1 run scoreboard players get $avg_s vortex.tmp
