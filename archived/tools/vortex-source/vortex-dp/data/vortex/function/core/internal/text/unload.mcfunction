# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/text/unload
# Removes every storage entry owned by the text module.
data remove storage vortex:text s
data remove storage vortex:text out
data remove storage vortex:text err
data remove storage vortex:text_map lower
data remove storage vortex:text_map upper
data remove storage vortex:text_map digit
data remove storage vortex:text_map deny_name
data remove storage vortex:text_map deny_tag
data remove storage vortex:text_map lower_full
data remove storage vortex:text_map upper_full
data remove storage vortex:text_map full
function vortex:core/internal/text/reset
