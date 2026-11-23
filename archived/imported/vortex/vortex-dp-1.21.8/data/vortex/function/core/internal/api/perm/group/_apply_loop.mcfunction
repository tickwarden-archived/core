# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/perm/group/_apply_loop [INTERNAL]
# Applies vortex:engine _grp_tmp.pending (permission names) to the
# player whose pid is $grp_pid, adding or removing perm.<name> tags
# according to _grp_tmp.mode. Every name is checked with safe_name while
# still data, then handed to the macro one-liners - the same discipline as
# api/perm/require_eval.

execute unless data storage vortex:engine _grp_tmp.pending[0] run return 0
data remove storage vortex:validate in
data modify storage vortex:validate in.value set from storage vortex:engine _grp_tmp.pending[0]
execute if function vortex:systems/validate/safe_name if data storage vortex:engine _grp_tmp{mode:"add"} run function vortex:core/internal/api/perm/group/_add_one with storage vortex:validate in
execute if data storage vortex:validate out{valid:1b} if data storage vortex:engine _grp_tmp{mode:"remove"} run function vortex:core/internal/api/perm/group/_remove_one with storage vortex:validate in
data remove storage vortex:engine _grp_tmp.pending[0]
function vortex:core/internal/api/perm/group/_apply_loop
