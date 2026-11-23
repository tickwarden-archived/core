# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/text/scan_deny
# INPUT  vortex:text: s, tbl (name of a table in vortex:text_map)
# RETURN 1 if any character of s is a key of that table, else 0.
# s must not contain a quote or backslash (check with safe first).
execute store result score #tx_len vortex.tmp run data get storage vortex:text s
scoreboard players set #tx_i vortex.tmp 0
scoreboard players set #tx_hit vortex.tmp 0
execute if score #tx_len vortex.tmp matches 1.. run function vortex:core/internal/text/scan_deny_loop
return run scoreboard players get #tx_hit vortex.tmp
