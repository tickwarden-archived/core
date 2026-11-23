# vortex:core/internal/text/case [INTERNAL] maps every character of s through table vortex:text tbl
data remove storage vortex:text err
data remove storage vortex:text out
execute store result score #tx_len vortex.tmp run data get storage vortex:text s
execute if score #tx_len vortex.tmp matches 0 run data modify storage vortex:text out set value ""
execute if score #tx_len vortex.tmp matches 0 run return 1
execute store result score #tx_ok vortex.tmp run function vortex:core/internal/text/safe
execute if score #tx_ok vortex.tmp matches 0 run data modify storage vortex:text err set value "case: the string contains a quote or backslash"
execute if score #tx_ok vortex.tmp matches 0 run return 0
data modify storage vortex:text pc set value []
scoreboard players set #tx_i vortex.tmp 0
function vortex:core/internal/text/case_loop
function vortex:core/internal/text/join
return 1
