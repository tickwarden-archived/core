# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/block/_reg_fn [INTERNAL, MACRO: k]
# Register step for one handler key: absent is fine, present must be a valid function id.
$execute unless data storage vortex:input $(k) run return 1
data remove storage vortex:validate in
$data modify storage vortex:validate in.value set from storage vortex:input $(k)
execute unless function vortex:systems/validate/function_id run return 0
$data modify storage vortex:block tmp.reg.$(k) set from storage vortex:input $(k)
return 1
