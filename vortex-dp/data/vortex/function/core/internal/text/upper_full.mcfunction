# vortex:core/internal/text/upper_full
# INPUT  vortex:text: s    OUTPUT vortex:text: out   (or err)   RETURN 1 on success, 0 on failure
# Case mapping for the whole BMP (simple one-to-one mappings).
# s must not contain a quote or backslash.
execute unless data storage vortex:text_map {full:1b} run function vortex:core/internal/text/load_full
data modify storage vortex:text tbl set value "upper_full"
return run function vortex:core/internal/text/case
