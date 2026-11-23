# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/hook/unbind_check [MACRO]
# INPUT: $(event) — event field of the current bind
# If it does not match _hook_filter_event, put back into hook_binds.

$execute unless data storage vortex:engine {_hook_filter_event:"$(event)"} run data modify storage vortex:engine hook_binds append from storage vortex:engine _hook_unbinds[0]
