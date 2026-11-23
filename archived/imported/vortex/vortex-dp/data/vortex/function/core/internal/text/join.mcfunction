# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/text/join
# Concatenates the strings in vortex:text pc into vortex:text out.
# Every entry must already be free of double quotes and backslashes (see safe).
execute unless data storage vortex:text pc[0] run data modify storage vortex:text out set value ""
execute unless data storage vortex:text pc[0] run return 1
execute unless data storage vortex:text pc[1] run data modify storage vortex:text out set from storage vortex:text pc[0]
execute unless data storage vortex:text pc[1] run return 1
function vortex:core/internal/text/join_round
data modify storage vortex:text out set from storage vortex:text pc[0]
return 1
