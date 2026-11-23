# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/flag/copy
# Copies a flag value from one key to another.
# If the source flag is set, the destination is set.
# If the source flag is absent, the destination is removed.
#  Input : $(from) → source flag key
#          $(to)   → destination flag key
# Output: vortex:output result → 1b if copied (flag was set), 0b if cleared
#
# Example:
# data modify storage vortex:input from set value "feature_a"
# data modify storage vortex:input to set value "feature_a_backup"
# function vortex:systems/flag/copy with storage vortex:input {}
# ─────────────────────────────────────────────────────────────────

# Default: clear destination
data modify storage vortex:output result set value 0b

$execute if data storage vortex:engine flags.$(from) run data modify storage vortex:engine flags.$(to) set value 1b
$execute if data storage vortex:engine flags.$(from) run data modify storage vortex:output result set value 1b
$execute unless data storage vortex:engine flags.$(from) run data remove storage vortex:engine flags.$(to)
