# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/string/pad_left [MACRO]
execute if data storage vortex:engine modules{string:0b} run return 0
$scoreboard players set $pl_v vortex.tmp $(value)
$scoreboard players set $pl_w vortex.tmp $(width)

scoreboard players set $pl_neg vortex.tmp -1
execute if score $pl_v vortex.tmp matches ..-1 run scoreboard players operation $pl_v vortex.tmp *= $pl_neg vortex.tmp

scoreboard players set $pl_digits vortex.tmp 1
execute if score $pl_v vortex.tmp matches 10.. run scoreboard players set $pl_digits vortex.tmp 2
execute if score $pl_v vortex.tmp matches 100.. run scoreboard players set $pl_digits vortex.tmp 3
execute if score $pl_v vortex.tmp matches 1000.. run scoreboard players set $pl_digits vortex.tmp 4
execute if score $pl_v vortex.tmp matches 10000.. run scoreboard players set $pl_digits vortex.tmp 5
execute if score $pl_v vortex.tmp matches 100000.. run scoreboard players set $pl_digits vortex.tmp 6
execute if score $pl_v vortex.tmp matches 1000000.. run scoreboard players set $pl_digits vortex.tmp 7
execute if score $pl_v vortex.tmp matches 10000000.. run scoreboard players set $pl_digits vortex.tmp 8

scoreboard players operation $pl_pad vortex.tmp = $pl_w vortex.tmp
scoreboard players operation $pl_pad vortex.tmp -= $pl_digits vortex.tmp

data modify storage vortex:output result set value ""

execute if score $pl_pad vortex.tmp matches 1.. run data modify storage vortex:output result set value "0"
execute if score $pl_pad vortex.tmp matches 2.. run data modify storage vortex:output result set value "00"
execute if score $pl_pad vortex.tmp matches 3.. run data modify storage vortex:output result set value "000"
execute if score $pl_pad vortex.tmp matches 4.. run data modify storage vortex:output result set value "0000"
execute if score $pl_pad vortex.tmp matches 5.. run data modify storage vortex:output result set value "00000"
execute if score $pl_pad vortex.tmp matches 6.. run data modify storage vortex:output result set value "000000"
execute if score $pl_pad vortex.tmp matches 7.. run data modify storage vortex:output result set value "0000000"
