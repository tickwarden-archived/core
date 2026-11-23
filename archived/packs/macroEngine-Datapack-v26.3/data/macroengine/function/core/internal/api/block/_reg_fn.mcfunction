# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/api/block/_reg_fn [INTERNAL, MACRO: k]
# Register step for one handler key: absent is fine, present must be a valid function id.
$execute unless data storage macroengine:input $(k) run return 1
data remove storage macroengine:validate in
$data modify storage macroengine:validate in.value set from storage macroengine:input $(k)
execute unless function macroengine:systems/validate/function_id run return 0
$data modify storage macroengine:block tmp.reg.$(k) set from storage macroengine:input $(k)
return 1
