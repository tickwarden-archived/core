# vortex:core/internal/api/perm/trigger/unbind_reinsert [MACRO]
$data modify storage vortex:engine perm_triggers.$(name) append from storage vortex:engine _pt_unbind[0]
