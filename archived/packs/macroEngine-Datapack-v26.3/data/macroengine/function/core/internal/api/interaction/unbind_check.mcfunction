# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/api/interaction/unbind_check [MACRO]
$execute unless data storage macroengine:engine _ia_ucur{tag:"$(tag)",func:"$(func)"} run data modify storage macroengine:engine interaction_binds.$(list) append from storage macroengine:engine _ia_ucur
