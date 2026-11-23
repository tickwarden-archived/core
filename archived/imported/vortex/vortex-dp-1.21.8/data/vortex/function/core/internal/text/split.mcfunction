# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/text/split
# INPUT  vortex:text: s, sep (strings; "" splits into characters),
#          n (int, optional: 0 all, +n first n separators, -n last n separators),
#          keep_empty (byte, optional, default 0b)
# OUTPUT vortex:text: out (list of strings)
# RETURN number of entries in out. Splitting "" yields [""].
data remove storage vortex:text err
data modify storage vortex:text out set value []
execute unless data storage vortex:text n run data modify storage vortex:text n set value 0
execute store result score #tx_keep vortex.tmp run data get storage vortex:text keep_empty
execute store result score #tx_len vortex.tmp run data get storage vortex:text s
execute if score #tx_len vortex.tmp matches 0 run data modify storage vortex:text out set value [""]
execute if score #tx_len vortex.tmp matches 0 run return 1
execute store result score #tx_slen vortex.tmp run data get storage vortex:text sep
execute if score #tx_slen vortex.tmp matches 0 run scoreboard players set #tx_i vortex.tmp 0
execute if score #tx_slen vortex.tmp matches 0 run function vortex:core/internal/text/split_chars
execute if score #tx_slen vortex.tmp matches 0 run return run data get storage vortex:text out
data modify storage vortex:text needle set from storage vortex:text sep
execute store result score #tx_total vortex.tmp run function vortex:core/internal/text/find
scoreboard players set #tx_pos vortex.tmp 0
function vortex:core/internal/text/split_loop
scoreboard players operation #tx_a vortex.tmp = #tx_pos vortex.tmp
scoreboard players operation #tx_b vortex.tmp = #tx_len vortex.tmp
function vortex:core/internal/text/_cut_ab
function vortex:core/internal/text/split_emit
return run data get storage vortex:text out
