# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/systems/log/print_entry
function macroengine:core/internal/systems/log/print_macro with storage macroengine:engine _felist_current
