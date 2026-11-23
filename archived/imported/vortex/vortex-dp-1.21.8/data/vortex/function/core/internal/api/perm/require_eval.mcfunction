# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/perm/require_eval  [INTERNAL — macro function]
# Only ever called by api/perm/require AFTER $(perm) passed systems/validate/safe_name.
# Do not call directly with unvalidated input.
$execute if entity @s[tag=perm.$(perm)] run data modify storage vortex:output result set value 1b
