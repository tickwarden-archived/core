# vortex:core/internal/api/interaction/unbind_check [MACRO]
$execute unless data storage vortex:engine _ia_ucur{tag:"$(tag)",func:"$(func)"} run data modify storage vortex:engine interaction_binds.$(list) append from storage vortex:engine _ia_ucur
