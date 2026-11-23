# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/text/unload
# Removes every storage entry owned by the text module.
data remove storage macroengine:text s
data remove storage macroengine:text out
data remove storage macroengine:text err
data remove storage macroengine:text_map lower
data remove storage macroengine:text_map upper
data remove storage macroengine:text_map digit
data remove storage macroengine:text_map deny_name
data remove storage macroengine:text_map deny_tag
data remove storage macroengine:text_map lower_full
data remove storage macroengine:text_map upper_full
data remove storage macroengine:text_map full
function macroengine:core/internal/text/reset
