# ─────────────────────────────────────────────────────────────────
# vortex:systems/flag/get_or_default
# Returns 1b if the flag is set, otherwise stores the given default.
#  Input : $(key)     → flag key
#          $(default) → value to store if flag is absent (0b or 1b)
#  Output: vortex:output result → 1b if set, $(default) if absent
#
# Example:
# data modify storage vortex:input key set value "my_feature"
# data modify storage vortex:input default set value 0b
# function vortex:systems/flag/get_or_default with storage vortex:input {}
# vortex:output result = 0b (if flag not set)
# ─────────────────────────────────────────────────────────────────

$data modify storage vortex:output result set value $(default)
$execute if data storage vortex:engine flags.$(key) run data modify storage vortex:output result set value 1b
