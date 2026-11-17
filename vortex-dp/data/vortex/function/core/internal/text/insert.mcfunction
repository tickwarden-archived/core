# vortex:core/internal/text/insert
# INPUT  vortex:text: s, ins (strings), at (int, 0..length)
# OUTPUT vortex:text: out (string)   on failure: err, out unset
# RETURN 1 on success, 0 on failure. s and ins must not contain a quote or backslash.
data remove storage vortex:text err
data remove storage vortex:text out
execute unless data storage vortex:text at run data modify storage vortex:text at set value 0
execute store result score #tx_len vortex.tmp run data get storage vortex:text s
execute store result score #tx_at vortex.tmp run data get storage vortex:text at
execute if score #tx_at vortex.tmp matches ..-1 run data modify storage vortex:text err set value "insert: index out of range"
execute if score #tx_at vortex.tmp > #tx_len vortex.tmp run data modify storage vortex:text err set value "insert: index out of range"
execute if data storage vortex:text err run return 0
data modify storage vortex:text r set value {}
data modify storage vortex:text r.s set from storage vortex:text s
data modify storage vortex:text r.ins set from storage vortex:text ins
execute store result score #tx_ok vortex.tmp run function vortex:core/internal/text/safe
execute if score #tx_ok vortex.tmp matches 0 run data modify storage vortex:text err set value "insert: the string contains a quote or backslash"
execute if score #tx_ok vortex.tmp matches 0 run return 0
data modify storage vortex:text s set from storage vortex:text r.ins
execute store result score #tx_ok vortex.tmp run function vortex:core/internal/text/safe
data modify storage vortex:text s set from storage vortex:text r.s
execute store result score #tx_len vortex.tmp run data get storage vortex:text s
execute if score #tx_ok vortex.tmp matches 0 run data modify storage vortex:text err set value "insert: the inserted text contains a quote or backslash"
execute if score #tx_ok vortex.tmp matches 0 run return 0
data modify storage vortex:text pc set value []
scoreboard players set #tx_a vortex.tmp 0
scoreboard players operation #tx_b vortex.tmp = #tx_at vortex.tmp
function vortex:core/internal/text/_cut_ab
data modify storage vortex:text pc append from storage vortex:text win
data modify storage vortex:text pc append from storage vortex:text r.ins
scoreboard players operation #tx_a vortex.tmp = #tx_at vortex.tmp
scoreboard players operation #tx_b vortex.tmp = #tx_len vortex.tmp
function vortex:core/internal/text/_cut_ab
data modify storage vortex:text pc append from storage vortex:text win
function vortex:core/internal/text/join
return 1
