# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/text/to_number
# INPUT  vortex:text: s (string like "42", "-7", "3.14")
# OUTPUT vortex:text: out (int or double)   on failure: err, out unset
# RETURN 1 on success, 0 on failure. Whole numbers are limited to 9 digits.
data remove storage vortex:text out
data modify storage vortex:text allow_dot set value 1b
execute store result score #tx_ok vortex.tmp run function vortex:core/internal/text/num_check
execute if score #tx_ok vortex.tmp matches 0 run return 0
scoreboard players operation #tx_digits vortex.tmp = #tx_len vortex.tmp
scoreboard players operation #tx_digits vortex.tmp -= #tx_start vortex.tmp
execute if score #tx_dots vortex.tmp matches 0 if score #tx_digits vortex.tmp matches 10.. run data modify storage vortex:text err set value "to_number: whole numbers are limited to 9 digits"
execute if score #tx_dots vortex.tmp matches 1 if score #tx_digits vortex.tmp matches 18.. run data modify storage vortex:text err set value "to_number: too many digits"
execute if data storage vortex:text err run return 0
data modify storage vortex:text arg set value {}
data modify storage vortex:text arg.s set from storage vortex:text s
function vortex:core/internal/text/_num_emit with storage vortex:text arg
return 1
