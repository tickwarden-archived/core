# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/text/num_check
# INPUT  vortex:text: s, allow_dot (byte: 1b also accepts one decimal point)
# RETURN 1 when s is a whole number (or decimal), 0 otherwise with err set.
# Accepts an optional leading '-'. A '.' must have digits on both sides.
# No size limit here; to_number adds one.
data remove storage vortex:text err
execute store result score #tx_len vortex.tmp run data get storage vortex:text s
execute store result score #tx_dotok vortex.tmp run data get storage vortex:text allow_dot
execute if score #tx_len vortex.tmp matches 0 run data modify storage vortex:text err set value "empty input"
execute if score #tx_len vortex.tmp matches 0 run return 0
scoreboard players set #tx_a vortex.tmp 0
scoreboard players set #tx_b vortex.tmp 1
function vortex:core/internal/text/_cut_ab
scoreboard players set #tx_start vortex.tmp 0
execute if data storage vortex:text {win:"-"} run scoreboard players set #tx_start vortex.tmp 1
execute if score #tx_start vortex.tmp >= #tx_len vortex.tmp if score #tx_dotok vortex.tmp matches 0 run data modify storage vortex:text err set value "no digits after '-'"
execute if score #tx_start vortex.tmp >= #tx_len vortex.tmp if score #tx_dotok vortex.tmp matches 1 run data modify storage vortex:text err set value "no digits"
execute if data storage vortex:text err run return 0
data modify storage vortex:text needle set value "."
data modify storage vortex:text n set value 0
execute store result score #tx_dots vortex.tmp run function vortex:core/internal/text/find
execute if score #tx_dots vortex.tmp matches 2.. run data modify storage vortex:text err set value "more than one '.'"
execute if score #tx_dots vortex.tmp matches 1 if score #tx_dotok vortex.tmp matches 0 run data modify storage vortex:text err set value "contains a non-digit character"
execute if data storage vortex:text err run return 0
scoreboard players set #tx_dotpos vortex.tmp -1
execute if score #tx_dots vortex.tmp matches 1 store result score #tx_dotpos vortex.tmp run data get storage vortex:text idx[0]
scoreboard players operation #tx_last vortex.tmp = #tx_len vortex.tmp
scoreboard players remove #tx_last vortex.tmp 1
execute if score #tx_dots vortex.tmp matches 1 if score #tx_dotpos vortex.tmp = #tx_start vortex.tmp run data modify storage vortex:text err set value "malformed decimal point"
execute if score #tx_dots vortex.tmp matches 1 if score #tx_dotpos vortex.tmp = #tx_last vortex.tmp run data modify storage vortex:text err set value "malformed decimal point"
execute if data storage vortex:text err run return 0
scoreboard players operation #tx_i vortex.tmp = #tx_start vortex.tmp
data modify storage vortex:text isd set value 1b
execute store result score #tx_r vortex.tmp run function vortex:core/internal/text/num_scan_loop
execute if score #tx_r vortex.tmp matches 0 run data modify storage vortex:text err set value "contains a non-digit character"
execute if score #tx_r vortex.tmp matches 0 run return 0
return 1
