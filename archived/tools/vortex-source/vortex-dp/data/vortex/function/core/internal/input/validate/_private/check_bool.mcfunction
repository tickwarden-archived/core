# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ======================================================================================
# vortex:core/internal/input/validate/_private/check_bool  [INTERNAL]
# ======================================================================================
# Requires scratch.value to be the exact string "true" or "false". No
# case-folding — "True"/"TRUE" are rejected on purpose, since silently
# accepting them just moves the ambiguity one step further down instead
# of resolving it.
# ======================================================================================

execute if data storage vortex:input_validate {scratch:{value:"true"}} run data modify storage vortex:input_validate result.valid set value 1b
execute if data storage vortex:input_validate {scratch:{value:"false"}} run data modify storage vortex:input_validate result.valid set value 1b

execute unless data storage vortex:input_validate {result:{valid:1b}} run data modify storage vortex:input_validate result.error set value "expected exactly \"true\" or \"false\""
