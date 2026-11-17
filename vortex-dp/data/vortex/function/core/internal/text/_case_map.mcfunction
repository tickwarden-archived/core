# vortex:core/internal/text/_case_map [MACRO]
# INPUT $(t) table name, $(c) one character (quote and backslash are excluded by safe).
# Leaves ch untouched when the table has no entry for c.
$data modify storage vortex:text ch set from storage vortex:text_map $(t)."$(c)"
