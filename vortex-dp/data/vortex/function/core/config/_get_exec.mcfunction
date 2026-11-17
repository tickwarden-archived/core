# vortex:core/config/_get_exec [MACRO, INTERNAL]
# Only keys present in the schema are readable; a dotted path into a schema entry has no type and is refused.
data remove storage vortex:engine config_sc
$data modify storage vortex:engine config_sc set from storage vortex:engine config_schema.$(key)
execute unless data storage vortex:engine config_sc.t run return 0
$data modify storage vortex:output result set from storage vortex:engine config.$(key)
