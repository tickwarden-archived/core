# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:systems/hook/internal/unbind_check [MACRO]
# INPUT: $(event) — event field of the current bind
# If it does not match _hook_filter_event, put back into hook_binds.

$execute unless data storage macroengine:engine {_hook_filter_event:"$(event)"} run data modify storage macroengine:engine hook_binds append from storage macroengine:engine _hook_unbinds[0]
