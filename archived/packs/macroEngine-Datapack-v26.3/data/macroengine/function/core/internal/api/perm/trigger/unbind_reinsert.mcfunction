# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/api/perm/trigger/unbind_reinsert [MACRO]
$data modify storage macroengine:engine perm_triggers.$(name) append from storage macroengine:engine _pt_unbind[0]
