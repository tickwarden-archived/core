# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/text/replace
# INPUT  vortex:text: s, needle, rep (strings), n (int, optional: 0 all, +n first n, -n last n)
# OUTPUT vortex:text: out (string)   on failure: err, out unset
# RETURN number of replacements. s and rep must not contain a quote or backslash.
data remove storage vortex:text err
data remove storage vortex:text out
execute unless data storage vortex:text n run data modify storage vortex:text n set value 0
data modify storage vortex:text r set value {}
data modify storage vortex:text r.s set from storage vortex:text s
data modify storage vortex:text r.needle set from storage vortex:text needle
data modify storage vortex:text r.rep set from storage vortex:text rep
data modify storage vortex:text r.n set from storage vortex:text n
execute store result score #tx_ok vortex.tmp run function vortex:core/internal/text/safe
execute if score #tx_ok vortex.tmp matches 0 run data modify storage vortex:text err set value "replace: the string contains a quote or backslash"
execute if score #tx_ok vortex.tmp matches 0 run return 0
data modify storage vortex:text s set from storage vortex:text r.rep
execute store result score #tx_ok vortex.tmp run function vortex:core/internal/text/safe
data modify storage vortex:text s set from storage vortex:text r.s
execute if score #tx_ok vortex.tmp matches 0 run data modify storage vortex:text err set value "replace: the replacement contains a quote or backslash"
execute if score #tx_ok vortex.tmp matches 0 run return 0
data modify storage vortex:text needle set from storage vortex:text r.needle
data modify storage vortex:text n set from storage vortex:text r.n
execute store result score #tx_total vortex.tmp run function vortex:core/internal/text/find
execute if score #tx_total vortex.tmp matches 0 run data modify storage vortex:text out set from storage vortex:text r.s
execute if score #tx_total vortex.tmp matches 0 run return 0
data modify storage vortex:text pc set value []
scoreboard players set #tx_pos vortex.tmp 0
function vortex:core/internal/text/replace_loop
execute store result score #tx_len vortex.tmp run data get storage vortex:text s
scoreboard players operation #tx_a vortex.tmp = #tx_pos vortex.tmp
scoreboard players operation #tx_b vortex.tmp = #tx_len vortex.tmp
function vortex:core/internal/text/_cut_ab
data modify storage vortex:text pc append from storage vortex:text win
function vortex:core/internal/text/join
return run scoreboard players get #tx_total vortex.tmp
