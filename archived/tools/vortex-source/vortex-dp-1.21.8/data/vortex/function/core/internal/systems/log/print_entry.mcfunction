# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/log/print_entry
function vortex:core/internal/systems/log/print_macro with storage vortex:engine _felist_current
