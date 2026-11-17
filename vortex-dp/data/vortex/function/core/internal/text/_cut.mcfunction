# vortex:core/internal/text/_cut [MACRO]
# INPUT $(a) $(b): win = substring [a, b) of storage vortex:text s. Bounds must be valid.
$data modify storage vortex:text win set string storage vortex:text s $(a) $(b)
