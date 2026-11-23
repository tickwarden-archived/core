# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/interaction/unbind_check [MACRO]
$execute unless data storage vortex:engine _ia_ucur{tag:"$(tag)",func:"$(func)"} run data modify storage vortex:engine interaction_binds.$(list) append from storage vortex:engine _ia_ucur
