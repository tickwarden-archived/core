# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/math/weighted_random [MACRO]
execute if data storage vortex:engine modules{math:0b} run return 0
$scoreboard players set $wr_total vortex.tmp $(total)

execute if score $wr_total vortex.tmp matches ..0 run data modify storage vortex:output result set value -1
execute if score $wr_total vortex.tmp matches ..0 run return 0

# Draw random in range 0..total-1
data modify storage vortex:engine _math_rnd_tmp.min set value 0
scoreboard players remove $wr_total vortex.tmp 1
execute store result storage vortex:engine _math_rnd_tmp.max int 1 run scoreboard players get $wr_total vortex.tmp
function vortex:systems/math/random with storage vortex:engine _math_rnd_tmp

execute store result score $wr_roll vortex.tmp run data get storage vortex:output result
execute store result storage vortex:output roll int 1 run scoreboard players get $wr_roll vortex.tmp

data modify storage vortex:output result set value -1
scoreboard players set $wr_done vortex.tmp 0

# Cumulative threshold check
$scoreboard players set $wr_acc vortex.tmp $(w0)
execute if score $wr_done vortex.tmp matches 0 run execute if score $wr_roll vortex.tmp < $wr_acc vortex.tmp run data modify storage vortex:output result set value 0
execute if score $wr_done vortex.tmp matches 0 run execute if score $wr_roll vortex.tmp < $wr_acc vortex.tmp run scoreboard players set $wr_done vortex.tmp 1

$scoreboard players add $wr_acc vortex.tmp $(w1)
execute if score $wr_done vortex.tmp matches 0 run execute if score $wr_roll vortex.tmp < $wr_acc vortex.tmp run data modify storage vortex:output result set value 1
execute if score $wr_done vortex.tmp matches 0 run execute if score $wr_roll vortex.tmp < $wr_acc vortex.tmp run scoreboard players set $wr_done vortex.tmp 1

$scoreboard players add $wr_acc vortex.tmp $(w2)
execute if score $wr_done vortex.tmp matches 0 run execute if score $wr_roll vortex.tmp < $wr_acc vortex.tmp run data modify storage vortex:output result set value 2
execute if score $wr_done vortex.tmp matches 0 run execute if score $wr_roll vortex.tmp < $wr_acc vortex.tmp run scoreboard players set $wr_done vortex.tmp 1

$scoreboard players add $wr_acc vortex.tmp $(w3)
execute if score $wr_done vortex.tmp matches 0 run execute if score $wr_roll vortex.tmp < $wr_acc vortex.tmp run data modify storage vortex:output result set value 3
execute if score $wr_done vortex.tmp matches 0 run execute if score $wr_roll vortex.tmp < $wr_acc vortex.tmp run scoreboard players set $wr_done vortex.tmp 1

$scoreboard players add $wr_acc vortex.tmp $(w4)
execute if score $wr_done vortex.tmp matches 0 run execute if score $wr_roll vortex.tmp < $wr_acc vortex.tmp run data modify storage vortex:output result set value 4
execute if score $wr_done vortex.tmp matches 0 run execute if score $wr_roll vortex.tmp < $wr_acc vortex.tmp run scoreboard players set $wr_done vortex.tmp 1

$scoreboard players add $wr_acc vortex.tmp $(w5)
execute if score $wr_done vortex.tmp matches 0 run execute if score $wr_roll vortex.tmp < $wr_acc vortex.tmp run data modify storage vortex:output result set value 5
execute if score $wr_done vortex.tmp matches 0 run execute if score $wr_roll vortex.tmp < $wr_acc vortex.tmp run scoreboard players set $wr_done vortex.tmp 1

$scoreboard players add $wr_acc vortex.tmp $(w6)
execute if score $wr_done vortex.tmp matches 0 run execute if score $wr_roll vortex.tmp < $wr_acc vortex.tmp run data modify storage vortex:output result set value 6
execute if score $wr_done vortex.tmp matches 0 run execute if score $wr_roll vortex.tmp < $wr_acc vortex.tmp run scoreboard players set $wr_done vortex.tmp 1

$scoreboard players add $wr_acc vortex.tmp $(w7)
execute if score $wr_done vortex.tmp matches 0 run execute if score $wr_roll vortex.tmp < $wr_acc vortex.tmp run data modify storage vortex:output result set value 7
execute if score $wr_done vortex.tmp matches 0 run execute if score $wr_roll vortex.tmp < $wr_acc vortex.tmp run scoreboard players set $wr_done vortex.tmp 1

$scoreboard players add $wr_acc vortex.tmp $(w8)
execute if score $wr_done vortex.tmp matches 0 run execute if score $wr_roll vortex.tmp < $wr_acc vortex.tmp run data modify storage vortex:output result set value 8
execute if score $wr_done vortex.tmp matches 0 run execute if score $wr_roll vortex.tmp < $wr_acc vortex.tmp run scoreboard players set $wr_done vortex.tmp 1

$scoreboard players add $wr_acc vortex.tmp $(w9)
execute if score $wr_done vortex.tmp matches 0 run execute if score $wr_roll vortex.tmp < $wr_acc vortex.tmp run data modify storage vortex:output result set value 9
execute if score $wr_done vortex.tmp matches 0 run execute if score $wr_roll vortex.tmp < $wr_acc vortex.tmp run scoreboard players set $wr_done vortex.tmp 1
