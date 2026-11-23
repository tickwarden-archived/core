# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/perm/trigger/unbind_reinsert [MACRO]
$data modify storage vortex:engine perm_triggers.$(name) append from storage vortex:engine _pt_unbind[0]
