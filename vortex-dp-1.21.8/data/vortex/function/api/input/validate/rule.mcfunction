# vortex:api/input/validate/rule [MACRO]
# Checks one captured value against a named rule (see input/validate/rule_define).
# AI-assisted: written with Claude (Anthropic); see CREDITS.md.
#
# INPUT (macro args): source  dot-path INTO vortex:input, e.g. "book.raw"
#                     rule    name given to rule_define
# OUTPUT (storage vortex:input_validate result):
#   valid   1b when the value passes the rule, else 0b
#   value   the value as given (only when it exists)
#   error   reason when invalid: "unknown rule", "no value", "not a string",
#           "contains a quote or backslash (needed for ignore_case)",
#           "value not allowed", "value is denied"
# RETURN 1 when valid, 0 otherwise. The scratch value stays in vortex:input_validate _r until the next call.
#
# Usage:
#   function vortex:api/input/validate/rule {source:"book.raw",rule:"yesno"}
#   execute if data storage vortex:input_validate result{valid:1b} run ...
#
# For dialogs: whatever callback hands you the submitted text, put it under storage
# vortex:input (data modify storage vortex:input dialog.answer set from ...) and point
# source at that path. Do not paste player text into a macro argument or command line.

data remove storage vortex:input_validate result
data modify storage vortex:input_validate result.valid set value 0b
$execute unless data storage vortex:input_validate rules.$(rule) run data modify storage vortex:input_validate result.error set value "unknown rule"
$execute unless data storage vortex:input_validate rules.$(rule) run return 0
$execute unless data storage vortex:input $(source) run data modify storage vortex:input_validate result.error set value "no value"
$execute unless data storage vortex:input $(source) run return 0

data remove storage vortex:input_validate _r
$data modify storage vortex:input_validate _r.rule set from storage vortex:input_validate rules.$(rule)
$data modify storage vortex:input_validate _r.s set string storage vortex:input $(source)
execute unless data storage vortex:input_validate _r.s run data modify storage vortex:input_validate result.error set value "not a string"
execute unless data storage vortex:input_validate _r.s run return 0
data modify storage vortex:input_validate result.value set from storage vortex:input_validate _r.s
data modify storage vortex:input_validate _r.ic set from storage vortex:input_validate _r.rule.ignore_case

execute if data storage vortex:input_validate _r{ic:1b} run function vortex:api/input/validate/_rule_lower_s
execute if data storage vortex:input_validate _r{fail:1b} run data modify storage vortex:input_validate result.error set value "contains a quote or backslash (needed for ignore_case)"
execute if data storage vortex:input_validate _r{fail:1b} run return 0

execute if data storage vortex:input_validate _r.rule.deny[0] run data modify storage vortex:input_validate _r.pending set from storage vortex:input_validate _r.rule.deny
execute if data storage vortex:input_validate _r.rule.deny[0] run data modify storage vortex:input_validate _r.hit set value 0b
execute if data storage vortex:input_validate _r.rule.deny[0] run function vortex:api/input/validate/_rule_scan
execute if data storage vortex:input_validate _r{hit:1b} run data modify storage vortex:input_validate result.error set value "value is denied"
execute if data storage vortex:input_validate _r{hit:1b} run return 0

execute unless data storage vortex:input_validate _r.rule.allow[0] run data modify storage vortex:input_validate result.valid set value 1b
execute unless data storage vortex:input_validate _r.rule.allow[0] run return 1

data modify storage vortex:input_validate _r.pending set from storage vortex:input_validate _r.rule.allow
data modify storage vortex:input_validate _r.hit set value 0b
function vortex:api/input/validate/_rule_scan
execute unless data storage vortex:input_validate _r{hit:1b} run data modify storage vortex:input_validate result.error set value "value not allowed"
execute unless data storage vortex:input_validate _r{hit:1b} run return 0
data modify storage vortex:input_validate result.valid set value 1b
data remove storage vortex:input_validate _r
return 1
